# Heartbeat checklist

## Verificações Periódicas (Dashboard GEO - Pessoal)
- Consultar lembretes pendentes: GET http://127.0.0.1:3003/api/reminders?status=active
- Consultar eventos do calendário de hoje
- Verificar se há transações recentes não categorizadas

## Quando falar
- Lembrete próximo (< 2h)
- Evento do calendário em menos de 1h
- Mais de 4 horas sem contato com George durante horário ativo
- **SEMPRE entregar lembretes solicitados explicitamente pelo George, independente do horário**

## Quando ficar quieto (HEARTBEAT_OK)
- Noite (23:00-07:00) exceto urgências OU lembretes explícitos
- Nada novo desde a última checagem
- Checou há menos de 30 minutos

## Token GEO Dashboard (PERMANENTE - válido até 2027)
Use Authorization: Bearer com o token abaixo:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoic2VydmljZUBnZW8ubG9jYWwiLCJpc1NlcnZpY2UiOnRydWUsImlhdCI6MTc3MDMyODQ3MSwiZXhwIjoxODAxODY0NDcxfQ.eVXZFzByV5iLKXLO90C0xJrNwgpdIKbSCMUGo0VDIJs
