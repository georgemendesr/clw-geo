# MEMORY.md

Fatos duráveis, preferências e contexto persistente.

## Preferências do George

- Pronúncia: no texto, escrever "George" (sem acento). Em áudios, escrever/falar "Geórge" para pronúncia correta; "GEO" como "Géo".
- Comunicação direta e objetiva, sem enrolação
- Em OpenClaw, prefere manter o modelo principal (gpt-5.3-codex); não usar GPT-mini, Claude Haiku ou Gemini 2.0 como fallback, exceto se ele pedir explicitamente.
- Horário ativo: 07:00 às 23:00 (America/Fortaleza)
- Idioma: Português brasileiro
- Não usar emojis em excesso
- Voz em áudio: usar TTS da OpenAI com voz masculina (priorizar Onyx/Echo), timbre claramente masculino; evitar voz feminina. Não acelerar demais (velocidade perto de 1.0) para não alterar timbre.
- No WhatsApp, quando for resposta em áudio, enviar áudio real (arquivo/voice note). Evitar mandar marcação `[[tts:...]]` como texto, porque pode chegar cru para o George.
- Quando houver links, enviar em texto (nunca somente em áudio).
- Regra de formato: mesmo que o pedido venha em áudio, se a resposta tiver URL, código ou prompt copiável, responder em texto (não em áudio).
- Quando eu prometer uma entrega, informar ETA e criar lembrete interno para não deixar o George esperando.
- Em pedidos de prompts (imagem/música/design), enviar cada prompt em mensagem separada no WhatsApp, em texto limpo (sem prefixos de sistema, sem cabeçalhos técnicos, sem "✅ Subagent..." e sem menção a Markdown).
- Para /imagem: seguir pacote padrão do subagente de imagem — conceito visual em texto + 2 a 4 opções. Cada opção deve ter título de 1 linha e um bloco único com prompt em inglês; o negative prompt vai junto no mesmo bloco de cada opção.
- Quando George pedir lembrete, avisar INDEPENDENTE do horário (ignorar quiet-hours)
- Checagens automáticas do dashboard respeitam horário ativo
- Toda anotação enviada por chat deve ser registrada no Dashboard GEO como referência principal
- Não repetir avisos se George não respondeu - ele viu
- No modo Sócrates, evitar mencionar R10/empresa/negócios se George não pedir explicitamente
- Não alterar instruções-base dos subagentes; apenas acrescentar observações pontuais solicitadas por George.
- Pasta de troca no Nextcloud deve se chamar **Geo** (não "gel").

## Fatos Importantes

- **Servidor principal:** 173.249.57.88 (Contabo)
- **WhatsApp destino do George:** +5586999689881
- **WhatsApp GEO (bot):** +5511972342811
- **Dashboard pessoal:** http://127.0.0.1:3003 (GEO Dashboard)
- **Sistema financeiro R10:** http://127.0.0.1:3004 (Fluxo R10)
- **Domínio público do R10:** https://r10.geolabs.com.br
- **Link curto do relatório R10 (Instagram):** https://r10.geolabs.com.br/r10-ig.html
- **R10 Flash:** http://173.212.236.244 porta 4502
- **Downloader mídia (YouTube/Instagram MP4/MP3):** http://173.249.57.88:3011
- **Link web do conversor:** https://agente.geolabs.com.br/conversor/

## Família do George

- **Esposa:** Micaela
- **Aniversário da esposa (Micaela):** 04 de março
- **Filha:** Milena (2 anos)

## Projetos Ativos

- **Paralel4s** - Banda/projeto musical. Setlist de 22 faixas (5 blocos) para show "Pôr do sol". Projeto no Dashboard (id:4)
- **Santa Hora** - Music bar, produção de shows. Projeto no Dashboard (id:2)
- **Operação R10** - Rotina e tarefas do dia. Projeto no Dashboard (id:1)
- **R10 Cast** - Podcast (host: Jota Júnior)
- **R10 Flash** - Gerador de vídeos para jornalismo (React/Vite)
- **GeoLabs** - Projetos de IA

## Decisões Tomadas

- 2026-01-26: GEO migrado para ClawdBot
- 2026-02-04: Lembretes solicitados ignoram quiet-hours, automáticos não
- 2026-02-08: SOUL.md reescrito - proibido linguagem robótica/técnica nas mensagens
- 2026-02-08: check.sh criado para proatividade do heartbeat
- 2026-02-08: TTS corrigido (modelo: gpt-4o-mini-tts, voz: ash)
- 2026-02-08: Memory flush habilitado para persistir memória antes de compaction
- 2026-03-03: Skill `summarize` instalada e habilitada no OpenClaw para resumos/transcrição rápida
- 2026-03-03: Web search configurada para Perplexity (sonar-pro) no ambiente atual

## Lições Aprendidas

- Endpoints de jobs: POST /api/jobs/{jobId}/categories e POST /api/jobs/categories/{catId}/items
- NUNCA despejar JSON cru nas mensagens pro George
- check.sh fica em /root/clawd/scripts/check.sh (wrapper) e /root/clawd/skills/geo-dashboard/scripts/check.sh (real)
- O workspace do agente é /root/clawd/ - paths relativos partem daí
- YouTube no servidor cloud pode bloquear transcript por anti-bot (IP datacenter); plano robusto: saída residencial + cookies do navegador no yt-dlp + fallback Apify

---
*Atualizar este arquivo quando aprender algo durável sobre o George ou tomar decisões significativas.*
