#\!/usr/bin/env bash
# GEO Dashboard - Proactivity Check Script
# Returns JSON with active reminders and today calendar events

TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImVtYWlsIjoic2VydmljZUBnZW8ubG9jYWwiLCJpc1NlcnZpY2UiOnRydWUsImlhdCI6MTc3MDMyODQ3MSwiZXhwIjoxODAxODY0NDcxfQ.eVXZFzByV5iLKXLO90C0xJrNwgpdIKbSCMUGo0VDIJs"
BASE="http://127.0.0.1:3003/api"
AUTH="Authorization: Bearer $TOKEN"

# Get active reminders
REMINDERS=$(curl -s "$BASE/reminders?status=active" -H "$AUTH" 2>/dev/null)

# Get today date for calendar
TODAY=$(date +%Y-%m-%d)
CALENDAR=$(curl -s "$BASE/calendar?start=$TODAY&end=$TODAY" -H "$AUTH" 2>/dev/null)

# Get upcoming reminders (next 24h)
UPCOMING=$(curl -s "$BASE/reminders/upcoming" -H "$AUTH" 2>/dev/null)

# Build combined JSON
echo "{\"reminders\":$REMINDERS,\"calendar\":$CALENDAR,\"upcoming\":$UPCOMING,\"checked_at\":\"$(date -Iseconds)\"}" | python3 -m json.tool 2>/dev/null || echo "{\"reminders\":$REMINDERS,\"calendar\":$CALENDAR,\"upcoming\":$UPCOMING,\"checked_at\":\"$(date -Iseconds)\"}"
