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
