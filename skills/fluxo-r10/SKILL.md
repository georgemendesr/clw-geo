---
name: fluxo-r10
description: Sistema financeiro da R10 Piauí (empresa). Gerencia despesas, receitas, clientes e categorias do portal.
---

# Fluxo R10 - Sistema Financeiro da Empresa

API local para gerenciar financas da R10 Piaui (empresa, NAO pessoal).

## Base URL

http://127.0.0.1:3004/api

## Diferenca para GEO Dashboard

- GEO Dashboard (porta 3003) = Financas PESSOAIS do George
- Fluxo R10 (porta 3004) = Financas da EMPRESA R10 Piaui

## Autenticacao

POST /api/auth/login com email e password
Usar token nas requisicoes: Authorization: Bearer TOKEN

Credenciais: george@r10piaui.com / r10@2025

## Endpoints Principais

### Dashboard
GET /api/dashboard/summary - Resumo financeiro

### Despesas
GET /api/despesas - Listar (query: mes, ano)
POST /api/despesas - Criar
PUT /api/despesas/:id - Atualizar
DELETE /api/despesas/:id - Deletar

Campos: titulo, valor, categoria, data_vencimento, status, pago_com, notas
Status: scheduled, paid, overdue, cancelled
Pago com: company, personal, credit_card, pix

### Receitas
GET /api/receitas - Listar
POST /api/receitas - Criar
PUT /api/receitas/:id - Atualizar
DELETE /api/receitas/:id - Deletar

Campos: titulo, valor, categoria, data_recebimento, status, cliente
Status: scheduled (pendente), paid (pago/recebido), overdue (atrasado), cancelled (cancelado)

### Clientes
GET /api/clientes - Listar
POST /api/clientes - Criar
PUT /api/clientes/:id - Atualizar

Campos: nome, tipo, cnpj_cpf, email, telefone
Tipos: empresa, pessoa, governo

### Categorias
GET /api/categorias - Listar
POST /api/categorias - Criar

Campos: nome, tipo (despesa/receita), cor, icone

### Despesas Fixas
GET /api/despesas-fixas - Listar recorrentes
POST /api/despesas-fixas - Criar

Campos: titulo, valor, categoria, dia_vencimento

### Contexto Assistente
GET /api/assistente/contexto - Memoria, stats, historico

---

## 🤖 Proatividade

### Verificar pendências financeiras
\\ash
./scripts/check.sh
\\nRetorna JSON com contas atrasadas e transações sem categoria.
