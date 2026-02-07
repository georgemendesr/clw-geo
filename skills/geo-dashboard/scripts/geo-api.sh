#!/usr/bin/env bash
# GEO Dashboard API Helper Script
# Uso: geo-api.sh <endpoint> [METHOD] [DATA]
# Ou:  geo-api.sh login <email> <senha>

BASE_URL="http://127.0.0.1:3003/api"
TOKEN_FILE="/root/.geo-dashboard-token"

ENDPOINT="${1:-}"
PARAM2="${2:-GET}"
PARAM3="${3:-}"

# Login especial
if [[ "$ENDPOINT" == "login" ]]; then
    EMAIL="$PARAM2"
    PASSWORD="$PARAM3"
    if [[ -z "$EMAIL" || -z "$PASSWORD" ]]; then
        echo "Uso: geo-api.sh login <email> <senha>"
        exit 1
    fi
    RESPONSE=$(curl -s -X POST "$BASE_URL/auth/login" \
        -H "Content-Type: application/json" \
        -d "{\"email\": \"$EMAIL\", \"password\": \"$PASSWORD\"}")
    
    TOKEN=$(echo "$RESPONSE" | jq -r '.token // empty')
    if [[ -n "$TOKEN" ]]; then
        echo "$TOKEN" > "$TOKEN_FILE"
        echo "✅ Login realizado! Token salvo em $TOKEN_FILE"
    else
        echo "❌ Erro: $(echo "$RESPONSE" | jq -r '.error // "Falha no login"')"
        exit 1
    fi
    exit 0
fi

# Verificar se token existe
if [[ ! -f "$TOKEN_FILE" ]]; then
    echo "❌ Token não encontrado. Execute: geo-api.sh login <email> <senha>"
    exit 1
fi

TOKEN=$(cat "$TOKEN_FILE")
METHOD="$PARAM2"
DATA="$PARAM3"

if [[ -z "$ENDPOINT" ]]; then
    echo "Uso: geo-api.sh <endpoint> [METHOD] [DATA]"
    echo "Endpoints: ideas, jobs, reminders, transactions, calendar"
    exit 1
fi

if [[ "$METHOD" == "GET" || -z "$DATA" ]]; then
    curl -s "$BASE_URL/$ENDPOINT" -H "Authorization: Bearer $TOKEN" | jq .
else
    curl -s -X "$METHOD" "$BASE_URL/$ENDPOINT" \
        -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "$DATA" | jq .
fi
