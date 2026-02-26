#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo '{"error": "Usage: speak.sh <text> [--voice alloy] [--model tts-1] [--format mp3] [--speed 1.0] [--out /path/to/out.mp3]"}' >&2
  exit 2
}

if [[ "${1:-}" == "" || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
fi

text="${1:-}"
shift || true

voice="alloy"
model="tts-1"
format="mp3"
speed="1.0"
out=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --voice)
      voice="${2:-}"
      shift 2
      ;;
    --model)
      model="${2:-}"
      shift 2
      ;;
    --format)
      format="${2:-}"
      shift 2
      ;;
    --speed)
      speed="${2:-}"
      shift 2
      ;;
    --out)
      out="${2:-}"
      shift 2
      ;;
    *)
      echo '{"error": "Unknown arg: '$1'"}' >&2
      exit 2
      ;;
  esac
done

if [[ "${OPENAI_API_KEY:-}" == "" ]]; then
  echo '{"error": "Missing OPENAI_API_KEY"}' >&2
  exit 1
fi

json=$(cat <<IFEOF
{
  "model": "${model}",
  "input": $(printf '%s' "$text" | jq -Rs .),
  "voice": "${voice}",
  "response_format": "${format}",
  "speed": ${speed}
}
IFEOF
)

if [[ "$out" == "" ]]; then
  out=$(mktemp --suffix=".${format}")
else
  mkdir -p "$(dirname "$out")"
fi

res=$(curl -sS -w "\n%{http_code}" -X POST https://api.openai.com/v1/audio/speech \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "$json" \
  -o "$out")

status=$(echo "$res" | tail -n1)

if [[ "$status" == "200" ]]; then
  echo "{\"status\": \"success\", \"file\": \"$out\"}"
else
  err=$(cat "$out" | tr '\n' ' ' | sed 's/"/\\"/g' || echo "Unknown error")
  echo "{\"status\": \"error\", \"message\": \"HTTP $status: $err\"}"
  exit 1
fi
