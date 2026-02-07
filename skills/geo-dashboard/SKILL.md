---
name: geo-dashboard
description: Acesso à API do Dashboard GEO para gerenciar ideias, trabalhos, lembretes, calendário e transações pessoais do George.
---

# 📊 GEO Dashboard API

API local para gerenciar dados PESSOAIS do George no dashboard GEO.

## Base URL

```
http://127.0.0.1:3003/api
```

## Autenticação

Todas as rotas requerem token JWT. Obtenha com:

```bash
curl -X POST http://127.0.0.1:3003/api/auth/login   -H "Content-Type: application/json"   -d '{"email": "georgemrs@gmail.com", "password": "SUA_SENHA"}'
```

Use o token em todas as requisições:
```
Authorization: Bearer SEU_TOKEN
```

---

## ⏰ Lembretes (Reminders)

### Listar lembretes
```bash
GET /api/reminders
GET /api/reminders?status=active
GET /api/reminders/upcoming  # Próximas 24h
```

### Criar lembrete
```bash
POST /api/reminders
Content-Type: application/json

{
  "title": "Reunião com cliente",        # OBRIGATÓRIO
  "remind_at": "2026-01-30T14:00:00",    # OBRIGATÓRIO - formato ISO 8601
  "description": "Detalhes do lembrete", # opcional
  "type": "once"                         # opcional: once, daily, weekly
}
```

### Atualizar lembrete
```bash
PUT /api/reminders/:id
{
  "status": "done"  # active, done, snoozed
}
```

### Deletar lembrete
```bash
DELETE /api/reminders/:id
```

### Adiar lembrete
```bash
POST /api/reminders/:id/snooze
{"minutes": 30}
```

---

## 📅 Calendário (Compromissos/Agenda)

O calendário usa a mesma tabela de reminders, mas com interface de agenda.

### Listar eventos
```bash
GET /api/calendar
GET /api/calendar?start=2026-01-01&end=2026-01-31
```

### Criar evento/compromisso
```bash
POST /api/calendar
Content-Type: application/json

{
  "title": "Reunião R10",          # OBRIGATÓRIO
  "date": "2026-01-30",            # OBRIGATÓRIO - formato YYYY-MM-DD
  "time": "14:00",                 # opcional - formato HH:MM (default: 09:00)
  "location": "Escritório",        # opcional
  "description": "Pauta: vendas"   # opcional
}
```

### Deletar evento
```bash
DELETE /api/calendar/:id
```

---

## 💡 Ideias

```bash
# Listar
GET /api/ideas

# Criar
POST /api/ideas
{"title": "Minha ideia", "description": "Desc", "category": "projeto"}

# Atualizar
PUT /api/ideas/:id
{"status": "em_andamento"}

# Deletar
DELETE /api/ideas/:id
```

**Campos:** title*, description, category, tags[], status (nova/em_andamento/concluida), priority

---

## 💰 Transações (Finanças Pessoais)

```bash
# Listar
GET /api/transactions

# Criar
POST /api/transactions
{
  "description": "Compra supermercado",
  "amount": -150.00,           # negativo=despesa, positivo=receita
  "type": "saida",           # entrada ou saida
  "category": "alimentacao",
  "date": "2026-01-29",
  "wallet_name": "Nubank"
}
```

---

## 📋 Trabalhos (Jobs)

```bash
# Listar trabalhos
GET /api/jobs

# Ver trabalho com tarefas
GET /api/jobs/:id

# Criar trabalho
POST /api/jobs
{"name": "Projeto X", "description": "...", "type": "projeto"}
```

### Tarefas
```bash
# Listar todas as tarefas
GET /api/jobs/items/all

# Criar tarefa
POST /api/jobs/categories/:categoryId/items
{"title": "Fazer X", "status": "pendente", "priority": 1}

# Atualizar tarefa
PUT /api/jobs/items/:id
{"status": "concluido"}
```

**Status tarefas:** pendente, em_andamento, concluido
