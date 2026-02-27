# TOOLS.md - Ferramentas Disponíveis

## Dashboard GEO (Padrão)
API REST para gerenciar a vida pessoal do George.

### Quando usar
- **Por padrão, SEMPRE use o Dashboard GEO**
- Projetos, ideias, lembretes, calendário, finanças pessoais
- **NUNCA use cron do sistema** para lembretes. Use `/api/reminders`.

### Base URL
http://127.0.0.1:3003/api

### Autenticação
Token JWT permanente em HEARTBEAT.md

### Endpoints
- GET/POST /api/reminders - Lembretes (Use este para TUDO que for "lembrar", "avisar")
- GET/POST /api/calendar - Calendário (Compromissos com hora marcada)
- GET/POST /api/jobs - Projetos (Listas de tarefas)
- GET/POST /api/ideas - Ideias
- GET/POST /api/transactions - Finanças pessoais

---

## Downloader de Mídia (YouTube/Instagram)
Ferramenta web para baixar/converter links públicos para MP4 ou MP3.

### URL
- http://173.249.57.88:3011

### Serviço
- PM2 app: `media-downloader`
- Código: `/root/media-dl-app`
- Cópia versionada no workspace: `/root/clawd/tools/media-dl-app`

---

## Fluxo R10 (Apenas quando solicitado)
API REST para finanças da empresa R10 Piauí.

### Quando usar
- SOMENTE quando George mencionar explicitamente "R10" ou "empresa"
- Nunca use sem instrução explícita

### Base URL
http://127.0.0.1:3004/api

### Credenciais
- Email: george@r10piaui.com
- Senha: r10@2025
