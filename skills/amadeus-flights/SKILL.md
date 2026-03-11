---
name: amadeus-flights
description: Search airline offers through the Amadeus Flights API, including auth setup, offer queries, and quick CLI-based testing. Use when the user wants a flight-search skill, Amadeus integration, or API-based airfare lookup instead of scraping metasearch sites.
---

# Amadeus Flights

Use this skill to wire a quick, testable flight-search flow against the Amadeus API.

## Quick start

1. Keep credentials only in environment variables:
   - `AMADEUS_API_KEY`
   - `AMADEUS_API_SECRET`
2. Use `scripts/search_flights.py` for the first real test.
3. Read `references/api_reference.md` if you need endpoint details.

## Default workflow

1. Verify the user has both the API key and secret.
2. Test auth first against the token endpoint.
3. Run a small flight-offers query.
4. Only after a successful query, expand into a fuller skill or integration.
5. Never hardcode secrets in SKILL.md, scripts, or memory files.

## Commands

Auth + sample round-trip search:

```bash
export AMADEUS_API_KEY='...'
export AMADEUS_API_SECRET='...'
python3 /root/clawd/skills/amadeus-flights/scripts/search_flights.py THE LIM 2026-04-15 --return-date 2026-04-22 --currency BRL --max 5
```

## Output guidance

- Show prices in BRL when possible.
- Treat Amadeus as structured flight data, not as a perfect Skyscanner replacement.
- If the API returns no offers or limited coverage, say that plainly.
- For WhatsApp delivery, keep results short and practical.
