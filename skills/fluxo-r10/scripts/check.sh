#\!/usr/bin/env bash
# Fluxo R10 - Financial Check Script
# Returns JSON with overdue bills and uncategorized transactions

BASE="http://127.0.0.1:3004/api"

# Login and get token
LOGIN=$(curl -s -X POST "$BASE/auth/login"   -H "Content-Type: application/json"   -d "{\"email\":\"george@r10piaui.com\",\"password\":\"r10@2025\"}" 2>/dev/null)

TOKEN=$(echo "$LOGIN" | python3 -c "import json,sys; print(json.load(sys.stdin).get(\"token\",\"\"))" 2>/dev/null)

if [ -z "$TOKEN" ]; then
  echo "{\"error\":\"Login failed\",\"detail\":\"$LOGIN\"}"
  exit 1
fi

AUTH="Authorization: Bearer $TOKEN"

# Get current month expenses
MES=$(date +%-m)
ANO=$(date +%Y)
DESPESAS=$(curl -s "$BASE/despesas?mes=$MES&ano=$ANO" -H "$AUTH" 2>/dev/null)

# Get dashboard summary
SUMMARY=$(curl -s "$BASE/dashboard/summary" -H "$AUTH" 2>/dev/null)

echo "{\"summary\":$SUMMARY,\"despesas_mes\":$DESPESAS,\"checked_at\":\"$(date -Iseconds)\"}" | python3 -m json.tool 2>/dev/null || echo "{\"summary\":$SUMMARY,\"despesas_mes\":$DESPESAS,\"checked_at\":\"$(date -Iseconds)\"}"
