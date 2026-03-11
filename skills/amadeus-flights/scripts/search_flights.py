#!/usr/bin/env python3
import argparse
import json
import os
import sys
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

import requests

AUTH_URL = "https://test.api.amadeus.com/v1/security/oauth2/token"
OFFERS_URL = "https://test.api.amadeus.com/v2/shopping/flight-offers"


class AmadeusError(Exception):
    pass


@dataclass
class SegmentInfo:
    carrier: str
    number: str
    origin: str
    destination: str
    departure: str
    arrival: str


@dataclass
class OfferSummary:
    price_total: str
    currency: str
    validating_airlines: List[str]
    last_ticketing_date: Optional[str]
    itineraries: List[Dict[str, Any]]
    raw: Dict[str, Any]


def get_env(name: str) -> str:
    value = os.getenv(name)
    if not value:
        raise AmadeusError(f"Missing environment variable: {name}")
    return value


def get_token(api_key: str, api_secret: str) -> str:
    resp = requests.post(
        AUTH_URL,
        data={
            "grant_type": "client_credentials",
            "client_id": api_key,
            "client_secret": api_secret,
        },
        timeout=30,
    )
    if resp.status_code != 200:
        raise AmadeusError(f"Auth failed ({resp.status_code}): {resp.text[:500]}")
    data = resp.json()
    token = data.get("access_token")
    if not token:
        raise AmadeusError("Auth succeeded but no access_token returned")
    return token


def parse_itinerary(itinerary: Dict[str, Any]) -> Dict[str, Any]:
    segments = itinerary.get("segments", [])
    duration = itinerary.get("duration")
    stops = max(0, len(segments) - 1)
    parsed_segments = []
    for seg in segments:
        carrier = seg.get("carrierCode", "")
        number = seg.get("number", "")
        dep = seg.get("departure", {})
        arr = seg.get("arrival", {})
        parsed_segments.append(
            {
                "flight": f"{carrier}{number}",
                "origin": dep.get("iataCode"),
                "destination": arr.get("iataCode"),
                "departure": dep.get("at"),
                "arrival": arr.get("at"),
                "carrier": carrier,
            }
        )
    return {
        "duration": duration,
        "stops": stops,
        "segments": parsed_segments,
    }


def fetch_offers(
    token: str,
    origin: str,
    destination: str,
    departure_date: str,
    return_date: Optional[str],
    adults: int,
    max_results: int,
    travel_class: Optional[str],
    non_stop: bool,
    currency: str,
) -> List[OfferSummary]:
    params = {
        "originLocationCode": origin,
        "destinationLocationCode": destination,
        "departureDate": departure_date,
        "adults": adults,
        "max": max_results,
        "currencyCode": currency,
    }
    if return_date:
        params["returnDate"] = return_date
    if travel_class:
        params["travelClass"] = travel_class
    if non_stop:
        params["nonStop"] = "true"

    resp = requests.get(
        OFFERS_URL,
        headers={"Authorization": f"Bearer {token}"},
        params=params,
        timeout=45,
    )
    if resp.status_code != 200:
        raise AmadeusError(f"Offer search failed ({resp.status_code}): {resp.text[:1000]}")
    data = resp.json()
    offers = []
    for offer in data.get("data", []):
        price = offer.get("price", {})
        offers.append(
            OfferSummary(
                price_total=price.get("grandTotal") or price.get("total") or "",
                currency=price.get("currency", currency),
                validating_airlines=offer.get("validatingAirlineCodes", []),
                last_ticketing_date=offer.get("lastTicketingDate"),
                itineraries=[parse_itinerary(i) for i in offer.get("itineraries", [])],
                raw=offer,
            )
        )
    return offers


def main() -> int:
    parser = argparse.ArgumentParser(description="Search round-trip or one-way flights via Amadeus test API")
    parser.add_argument("origin")
    parser.add_argument("destination")
    parser.add_argument("departure_date")
    parser.add_argument("--return-date")
    parser.add_argument("--adults", type=int, default=1)
    parser.add_argument("--max", type=int, default=10, dest="max_results")
    parser.add_argument("--travel-class", choices=["ECONOMY", "PREMIUM_ECONOMY", "BUSINESS", "FIRST"])
    parser.add_argument("--non-stop", action="store_true")
    parser.add_argument("--currency", default="BRL")
    parser.add_argument("--format", choices=["json", "pretty"], default="pretty")
    args = parser.parse_args()

    try:
        api_key = get_env("AMADEUS_API_KEY")
        api_secret = get_env("AMADEUS_API_SECRET")
        token = get_token(api_key, api_secret)
        offers = fetch_offers(
            token=token,
            origin=args.origin,
            destination=args.destination,
            departure_date=args.departure_date,
            return_date=args.return_date,
            adults=args.adults,
            max_results=args.max_results,
            travel_class=args.travel_class,
            non_stop=args.non_stop,
            currency=args.currency,
        )
        if args.format == "json":
            print(json.dumps([o.__dict__ for o in offers], ensure_ascii=False, indent=2))
            return 0

        if not offers:
            print("No offers found")
            return 0

        for idx, offer in enumerate(offers, start=1):
            print(f"#{idx} | {offer.currency} {offer.price_total} | validating: {', '.join(offer.validating_airlines) or '-'} | ticket until: {offer.last_ticketing_date or '-'}")
            for itin_idx, itin in enumerate(offer.itineraries, start=1):
                label = "ida" if itin_idx == 1 else "volta"
                print(f"  {label}: duração {itin['duration']} | escalas {itin['stops']}")
                for seg in itin["segments"]:
                    print(
                        f"    {seg['flight']}: {seg['origin']} {seg['departure']} -> {seg['destination']} {seg['arrival']}"
                    )
            print()
        return 0
    except AmadeusError as e:
        print(str(e), file=sys.stderr)
        return 2
    except requests.RequestException as e:
        print(f"Network error: {e}", file=sys.stderr)
        return 3


if __name__ == "__main__":
    raise SystemExit(main())
