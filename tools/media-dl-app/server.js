const express = require('express');
const path = require('path');
const fs = require('fs');
const fsp = require('fs/promises');
const os = require('os');
const { spawn } = require('child_process');
const { URL } = require('url');

const app = express();
const PORT = process.env.PORT || 3011;

const YT_DLP_BIN = process.env.YT_DLP_BIN || '/root/.local/bin/yt-dlp';
const FFMPEG_BIN = process.env.FFMPEG_BIN || 'ffmpeg';
const NODE_BIN = process.env.NODE_BIN || '/usr/bin/node';

const ALLOWED_HOSTS = [
  'youtube.com',
  'www.youtube.com',
  'm.youtube.com',
  'youtu.be',
  'instagram.com',
  'www.instagram.com',
  'm.instagram.com',
];

app.use(express.json({ limit: '1mb' }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/health', (_req, res) => {
  res.json({ ok: true, service: 'media-downloader' });
});

function validateMediaUrl(raw) {
  let u;
  try {
    u = new URL(raw);
  } catch {
    throw new Error('URL inválida.');
  }

  if (!['http:', 'https:'].includes(u.protocol)) {
    throw new Error('Use apenas links http/https.');
  }

  const host = u.hostname.toLowerCase();
  const ok = ALLOWED_HOSTS.some((h) => host === h || host.endsWith(`.${h}`));
  if (!ok) {
    throw new Error('No momento, só aceito links de YouTube e Instagram.');
  }

  return u.toString();
}

function buildArgs(url, format, tmpDir) {
  const args = [
    '--no-playlist',
    '--restrict-filenames',
    '--newline',
    '--print',
    'after_move:filepath',
    '--paths',
    tmpDir,
    '--no-js-runtimes',
    '--js-runtimes',
    `node:${NODE_BIN}`,
  ];

  if (format === 'mp3') {
    args.push('-x', '--audio-format', 'mp3', '--audio-quality', '0');
  } else {
    args.push('-f', 'bv*+ba/b', '--merge-output-format', 'mp4');
  }

  args.push(url);
  return args;
}

function runYtDlp(url, format, tmpDir) {
  return new Promise((resolve, reject) => {
    const args = buildArgs(url, format, tmpDir);
    const child = spawn(YT_DLP_BIN, args, {
      env: process.env,
      stdio: ['ignore', 'pipe', 'pipe'],
    });

    let stdout = '';
    let stderr = '';

    child.stdout.on('data', (d) => {
      stdout += d.toString();
    });

    child.stderr.on('data', (d) => {
      stderr += d.toString();
    });

    child.on('error', (err) => {
      reject(new Error(`Falha ao iniciar yt-dlp: ${err.message}`));
    });

    child.on('close', async (code) => {
      if (code !== 0) {
        return reject(new Error(stderr.trim() || 'Falha no download/conversão.'));
      }

      const lines = stdout
        .split(/\r?\n/)
        .map((s) => s.trim())
        .filter(Boolean);

      let finalPath = lines.reverse().find((line) => fs.existsSync(line));

      if (!finalPath) {
        const files = await fsp.readdir(tmpDir);
        if (!files.length) {
          return reject(new Error('Arquivo final não encontrado.'));
        }
        files.sort();
        finalPath = path.join(tmpDir, files[files.length - 1]);
      }

      resolve(finalPath);
    });
  });
}

function convertToMp3(inputPath) {
  return new Promise((resolve, reject) => {
    const mp3Path = path.join(
      path.dirname(inputPath),
      `${path.basename(inputPath, path.extname(inputPath))}.mp3`
    );

    const args = ['-y', '-i', inputPath, '-vn', '-codec:a', 'libmp3lame', '-q:a', '2', mp3Path];
    const child = spawn(FFMPEG_BIN, args, { stdio: ['ignore', 'ignore', 'pipe'] });

    let stderr = '';
    child.stderr.on('data', (d) => {
      stderr += d.toString();
    });

    child.on('error', (err) => {
      reject(new Error(`Falha ao iniciar ffmpeg: ${err.message}`));
    });

    child.on('close', (code) => {
      if (code !== 0 || !fs.existsSync(mp3Path)) {
        return reject(new Error(stderr.trim() || 'Falha ao converter para MP3.'));
      }
      resolve(mp3Path);
    });
  });
}

async function safeCleanup(filePath) {
  try {
    const dir = path.dirname(filePath);
    await fsp.unlink(filePath).catch(() => {});
    await fsp.rm(dir, { recursive: true, force: true }).catch(() => {});
  } catch {}
}

app.post('/api/download', async (req, res) => {
  const { url, format } = req.body || {};
  try {
    const validUrl = validateMediaUrl((url || '').trim());
    const fmt = (format || '').toLowerCase();
    if (!['mp3', 'mp4'].includes(fmt)) {
      throw new Error('Formato inválido. Use mp3 ou mp4.');
    }

    const tmpDir = await fsp.mkdtemp(path.join(os.tmpdir(), 'media-dl-'));
    let finalPath;

    if (fmt === 'mp3') {
      try {
        finalPath = await runYtDlp(validUrl, 'mp3', tmpDir);
      } catch {
        const videoPath = await runYtDlp(validUrl, 'mp4', tmpDir);
        finalPath = await convertToMp3(videoPath);
      }
    } else {
      finalPath = await runYtDlp(validUrl, 'mp4', tmpDir);
    }

    const ext = path.extname(finalPath) || `.${fmt}`;
    const base = path.basename(finalPath, path.extname(finalPath));
    const downloadName = `${base}${ext}`;

    res.download(finalPath, downloadName, async () => {
      await safeCleanup(finalPath);
    });
  } catch (err) {
    res.status(400).json({ error: err.message || 'Erro ao processar download.' });
  }
});

app.listen(PORT, () => {
  console.log(`media-downloader online em http://127.0.0.1:${PORT}`);
});
