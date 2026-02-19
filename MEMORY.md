# MEMORY.md

Fatos duráveis, preferências e contexto persistente.

## Preferências do George

- Pronúncia: nome "George" deve ser falado como "Geórge"; "GEO" como "Géo".
- Comunicação direta e objetiva, sem enrolação
- Horário ativo: 07:00 às 23:00 (America/Fortaleza)
- Idioma: Português brasileiro
- Não usar emojis em excesso
- Quando George pedir lembrete, avisar INDEPENDENTE do horário (ignorar quiet-hours)
- Checagens automáticas do dashboard respeitam horário ativo
- Não repetir avisos se George não respondeu - ele viu

## Fatos Importantes

- **Servidor principal:** 173.249.57.88 (Contabo)
- **WhatsApp destino do George:** +5586999689881
- **WhatsApp GEO (bot):** +5511972342811
- **Dashboard pessoal:** http://127.0.0.1:3003 (GEO Dashboard)
- **Sistema financeiro R10:** http://127.0.0.1:3004 (Fluxo R10)
- **R10 Flash:** http://173.212.236.244 porta 4502

## Família do George

- **Esposa:** Micaela
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

## Lições Aprendidas

- Endpoints de jobs: POST /api/jobs/{jobId}/categories e POST /api/jobs/categories/{catId}/items
- NUNCA despejar JSON cru nas mensagens pro George
- check.sh fica em /root/clawd/scripts/check.sh (wrapper) e /root/clawd/skills/geo-dashboard/scripts/check.sh (real)
- O workspace do agente é /root/clawd/ - paths relativos partem daí

---
*Atualizar este arquivo quando aprender algo durável sobre o George ou tomar decisões significativas.*
