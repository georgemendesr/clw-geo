# Amadeus Flights API Reference

## Auth

Base auth endpoint:
- `POST https://test.api.amadeus.com/v1/security/oauth2/token`

Required form fields:
- `grant_type=client_credentials`
- `client_id=$AMADEUS_API_KEY`
- `client_secret=$AMADEUS_API_SECRET`

Returns `access_token`.

## Flight offers

Search endpoint:
- `GET https://test.api.amadeus.com/v2/shopping/flight-offers`

Common query params:
- `originLocationCode=THE`
- `destinationLocationCode=LIM`
- `departureDate=2026-04-15`
- `returnDate=2026-04-22`
- `adults=1`
- `currencyCode=BRL`
- `max=10`
- `travelClass=ECONOMY`
- `nonStop=true|false`

## Notes

- This skill is written for the **test** environment.
- Expect some fare/availability differences versus public metasearch sites.
- Use the script in `scripts/search_flights.py` for repeatable searches.
- Keep credentials in environment variables; do not hardcode secrets in the skill.

## Example

```bash
export AMADEUS_API_KEY='...'
export AMADEUS_API_SECRET='...'
python3 scripts/search_flights.py THE LIM 2026-04-15 --return-date 2026-04-22 --currency BRL --max 5
```
