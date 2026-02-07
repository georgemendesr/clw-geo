# Heartbeat checklist

## Verificações Periódicas (Consolidação de APIs)
- **Dashboard GEO (Pessoal):** Consultar lembretes pendentes (`/api/reminders?status=active`) e eventos do calendário (`/api/calendar?start=$(date +%Y-%m-%d)`)
- **Fluxo R10 (Empresa):** Consultar resumo financeiro e despesas vencendo hoje (`/api/despesas?mes=$(date +%m)&ano=$(date +%Y)`)
- **Estado Técnico:** Verificar se o agente tem tokens válidos para ambas as APIs.

## Quando falar
- Lembrete próximo (< 2h no Dashboard GEO)
- Despesa da empresa vencendo hoje no Fluxo R10
- Mais de 4 horas sem contato com George

## Quando ficar quieto (HEARTBEAT_OK)
- Noite (23:00-07:00) exceto urgências
- Nada novo nos dois sistemas desde a última checaem
- Checou há menos de 30 minutos

## Tokens Atuais
- GEO: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoiZ2VvcmdlbXJzQGdtYWlsLmNvbSIsImlhdCI6MTc2OTg4NTA2MiwiZXhwIjoxNzcwNDg5ODYyfQ.JLX3qqq6Ww8ALQoy7_OYID0HoJUbzcHfDVbCK-K9-00
- R10: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoiZ2VvcmdlQHIxMHBpYXVpLmNvbSIsIm5vbWUiOiJHZW9yZ2UgTWVuZGVzIiwiaWF0IjoxNzY5ODg1MDYyLCJleHAiOjE3NzA0ODk4NjJ9.zwSWgCANWUw7z9AdvEhRuvZmXnl6mMJEE5T6XTMB8MY
