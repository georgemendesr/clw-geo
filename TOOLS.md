# TOOLS.md - Ferramentas Disponíveis

## Dashboard GEO (Padrão)
API REST para gerenciar a vida pessoal do George.

### Quando usar
- Por padrão, SEMPRE use o Dashboard GEO
- Projetos, ideias, lembretes, calendário, finanças pessoais

### Base URL
http://127.0.0.1:3003/api

### Autenticação
Token JWT permanente em HEARTBEAT.md

### Endpoints
- GET/POST /api/reminders - Lembretes
- GET/POST /api/calendar - Calendário
- GET/POST /api/jobs - Projetos
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
