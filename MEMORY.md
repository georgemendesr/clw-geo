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
- Regra reforçada em 2026-03-08: se George mandar áudio, responder por áudio sempre.
- Quando houver links, enviar em texto (nunca somente em áudio).
- Regra de formato: mesmo que o pedido venha em áudio, se a resposta tiver URL, código ou prompt copiável, responder em texto (não em áudio).
- Preferência de canal de resposta: quando George pedir mensagem/prompt/texto para uso, entregar sempre em texto. Áudio só para conversa.
- Em pesquisa de passagens/preços, responder sempre em texto (não em áudio).
- Para qualquer resposta com link e/ou preço, priorizar texto mesmo quando o pedido vier por áudio.
- Em passagens, priorizar valores em reais (BRL); se vier em outra moeda, converter antes de enviar.
- Não enviar preço como fechado sem validação no link final (tarifa pode variar no clique).
- Quando eu prometer uma entrega, informar ETA e criar lembrete interno para não deixar o George esperando.
- Em pedidos de prompts (imagem/música/design), enviar cada prompt em mensagem separada no WhatsApp, em texto limpo (sem prefixos de sistema, sem cabeçalhos técnicos, sem "✅ Subagent..." e sem menção a Markdown).
- Para /imagem: seguir pacote padrão do subagente de imagem — conceito visual em texto + 2 a 4 opções. Cada opção deve ter título de 1 linha e um bloco único com prompt em inglês; o negative prompt vai junto no mesmo bloco de cada opção.
- Quando George pedir lembrete, avisar INDEPENDENTE do horário (ignorar quiet-hours)
- Checagens automáticas do dashboard respeitam horário ativo
- Toda anotação enviada por chat deve ser registrada no Dashboard GEO como referência principal
- O Geo Dashboard é a fonte central de verdade do George: lembretes, referências, anotações, calendário e financeiro devem ficar alinhados por lá por padrão.
- Não repetir avisos se George não respondeu - ele viu
- George não quer lembretes de tarefas o tempo inteiro; avisar só quando for relevante/urgente ou quando ele pedir.
- George prefere lembretes em linguagem natural, como papo humano, e não como aviso seco. Ex.: em vez de “cortar o cabelo”, falar algo como “Já cortou o cabelo, George? Cabelo cortado é autocuidado.”
- Em buscas complexas (ex.: passagens), George prefere receber a confirmação dos critérios por texto antes de iniciar a execução.
- No modo Sócrates, evitar mencionar R10/empresa/negócios se George não pedir explicitamente
- Não alterar instruções-base dos subagentes; apenas acrescentar observações pontuais solicitadas por George.
- Pasta de troca no Nextcloud deve se chamar **Geo** (não "gel").
- George sente a rotina atual como disfuncional: sem fim de semana, trabalhando manhã, tarde e noite, com pouco tempo para a filha. Em conversas sobre organização de vida, descanso e prioridades, tratar isso como tema sensível e prioritário.
- George relata lidar com sedentarismo e também com um vício; temas de saúde, autocuidado e mudança de rotina devem ser tratados com seriedade e sem moralismo.
- George revelou dependência de cocaína de longa data (cerca de 20 anos), em escalada, com dano nasal importante e terapia em andamento porém com adesão irregular. Em conversas sobre saúde, tratar isso como assunto prioritário, sensível e sem julgamento.
- Código de discrição definido com George para tratar desse tema: usar a expressão **assunto cinza**. Quando ele mencionar isso, entender que está falando da dependência/uso e responder com discrição, sem explicitar o tema desnecessariamente.
- Quando George trouxer o **assunto cinza**, entrar na chave do **Sócrates**: tom mais psicológico, reflexivo e humano, evitando abordagem técnica ou expositiva.
- Insight importante do George sobre o assunto cinza: ele percebe o impulso hoje menos como busca de euforia/alívio emocional e mais como necessidade física/ritual incorporado ao corpo, quase automática.
- Para lidar com o assunto cinza, George responde melhor a estratégias objetivas, concretas e visualizáveis do que a conselhos abstratos.
- Quando fica sem o assunto cinza, George relata impaciência, irritação e perda de concentração a ponto de travar o trabalho; esse é um gatilho importante para intervenções curtas e objetivas.
- No assunto cinza, George prefere mensagens bem curtas, práticas e visualizáveis; evitar textões e falar em passos simples.
- George quer proatividade nesse tema: não esperar só ele puxar; fazer check-ins discretos sobre o assunto cinza em momentos oportunos.
- George também quer alertas práticos e visualizáveis para alimentação ao longo do dia, com linguagem concreta sobre tempo sem comer/energia.
- George quer lembrete diário e prático para fazer 10 minutos de bicicleta em casa, como passo simples contra o sedentarismo.
- Para o lembrete diário da bicicleta, o horário mais apropriado para George é 17h.
- Na rotina de saúde, George relata alimentação muito irregular, perde peso com facilidade e quer ganhar peso; abordagens práticas e simples funcionam melhor.
- George tem uma bicicleta ergométrica em casa, vista por ele como recurso para sair do sedentarismo.
- Trabalhar em casa e quase não sair fez George relaxar no autocuidado diário; ele percebe desleixo com banho, aparência e rotina básica. Em temas de rotina, propor micro-rituais simples e concretos antes de falar em mudanças grandes.
- No escritório em casa, chinelo atrapalha George; para sinal de “modo trabalho”, faz mais sentido ficar descalço ou usar tênis do que chinelo.

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
- 2026-03-05: Em cotações de viagem, resposta final deve sair em texto + BRL + link; evitar áudio e moeda estrangeira
- 2026-03-05: Preço só é considerado válido após conferir no link final no momento do envio

## Lições Aprendidas

- Endpoints de jobs: POST /api/jobs/{jobId}/categories e POST /api/jobs/categories/{catId}/items
- NUNCA despejar JSON cru nas mensagens pro George
- check.sh fica em /root/clawd/scripts/check.sh (wrapper) e /root/clawd/skills/geo-dashboard/scripts/check.sh (real)
- O workspace do agente é /root/clawd/ - paths relativos partem daí
- YouTube no servidor cloud pode bloquear transcript por anti-bot (IP datacenter); plano robusto: saída residencial + cookies do navegador no yt-dlp + fallback Apify
- No WhatsApp, `[[tts:...]]` em texto não vira áudio; para áudio real é obrigatório enviar mídia/voice note (retorno `MEDIA:` da ferramenta de TTS).
- Quando houver “travamento” no WhatsApp, checar primeiro logs de conexão do provider (ex.: status 499, heartbeat restart e reconexões) antes de concluir falha de modelo/prompt.
- No Geo Dashboard, houve bug de timezone no endpoint `/api/calendar`: ele listava horários 3h adiantados ao usar `toISOString()`. Corrigido em 2026-03-10 para formatar em `America/Fortaleza`.

---
*Atualizar este arquivo quando aprender algo durável sobre o George ou tomar decisões significativas.*
