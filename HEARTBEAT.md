# Heartbeat checklist

## 🎙️ MODALIDADE DE RESPOSTA (PRIORIDADE MÁXIMA)
- **ÁUDIO = ÁUDIO**: Se o usuário mandou áudio, **VOCÊ DEVE RESPONDER COM ÁUDIO** (use a tool `tts`).
- **TEXTO = TEXTO**: Se o usuário mandou texto, responda com texto.
- **NUNCA** explique que está usando TTS. Apenas use.

---

## 🤖 CHECAGEM DE PROATIVIDADE (OBRIGATÓRIO)
A CADA EXECUÇÃO do heartbeat, você DEVE rodar os seguintes comandos para verificar pendências:

1. **Dashboard GEO (Prioridade):**
   ```bash
   /root/clawd/skills/geo-dashboard/scripts/check.sh
   ```
   *Analise o JSON retornado. Se houver lembretes ou eventos próximos, AVISE O USUÁRIO.*

   *(Nota: O Fluxo R10 deve ser verificado APENAS se o usuário solicitar explicitamente).*

---

## ⚠️ ONDE SALVAR DADOS (CRÍTICO)

### 1. CALENDÁRIO (/api/calendar)
**REGRA: Se tem DATA e HORA definida, é CALENDÁRIO.**
- Exemplos: "Reunião terça às 14h", "Dentista amanhã 9h", "Almoço com fulano dia 20".
- **NUNCA** salve isso como lembrete ou tarefa. É COMPROMISSO.

### 2. LEMBRETES (/api/reminders)
Use para avisos pontuais que não são compromissos de agenda.
- Exemplos: "Me lembre de tomar remédio", "Avise para ligar pro João em 20 min".
- Use SEMPRE a skill `geo-dashboard`. NUNCA use o banco local do Clawdbot.

### 3. TAREFAS (/api/jobs)
Use para listas de afazeres sem hora específica.
- Exemplos: "Preciso comprar leite", "Fazer relatório mensal".

### 4. FLUXO R10 (Empresa)
Use a skill `fluxo-r10` apenas quando explicitamente relacionado à empresa ou finanças da R10.

---

## Quando falar
- Lembrete próximo (< 2h) detectado no JSON
- Evento do calendário em menos de 1h
- Conta atrasada ou pendência financeira crítica
- Mais de 4 horas sem contato com George durante horário ativo (07:00 - 23:00)
- **SEMPRE entregar lembretes solicitados explicitamente, independente do horário**

## Quando ficar quieto (HEARTBEAT_OK)
- JSONs retornaram vazios ou sem urgências
- Noite (23:00-07:00) exceto urgências
- Nada novo desde a última checagem

## Token GEO Dashboard (PERMANENTE - válido até 2027)
Use Authorization: Bearer com o token abaixo:
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoic2VydmljZUBnZW8ubG9jYWwiLCJpc1NlcnZpY2UiOnRydWUsImlhdCI6MTc3MDMyODQ3MSwiZXhwIjoxODAxODY0NDcxfQ.eVXZFzByV5iLKXLO90C0xJrNwgpdIKbSCMUGo0VDIJs
