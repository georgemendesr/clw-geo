const fs = require('fs');
const { PDFDocument } = require('pdf-lib');

async function main() {
  const out = process.argv[2];
  const inputs = process.argv.slice(3);
  if (!out || inputs.length === 0) {
    console.error('usage: node merge_required.js out.pdf in1.pdf in2.pdf ...');
    process.exit(1);
  }
  const merged = await PDFDocument.create();
  for (const file of inputs) {
    const bytes = fs.readFileSync(file);
    const pdf = await PDFDocument.load(bytes, { ignoreEncryption: true });
    const pages = await merged.copyPages(pdf, pdf.getPageIndices());
    for (const p of pages) merged.addPage(p);
  }
  const outBytes = await merged.save();
  fs.writeFileSync(out, outBytes);
  console.log(`merged ${inputs.length} files -> ${out}`);
}
main().catch(err => { console.error(err); process.exit(1); });
