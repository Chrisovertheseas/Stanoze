#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-4173}"
HOST="${HOST:-127.0.0.1}"
URL="http://${HOST}:${PORT}/"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

find_python() {
  if command -v python3 >/dev/null 2>&1; then
    echo "python3"
    return 0
  fi

  if command -v python >/dev/null 2>&1; then
    echo "python"
    return 0
  fi

  if command -v py >/dev/null 2>&1; then
    echo "py -3"
    return 0
  fi

  return 1
}

open_browser() {
  if command -v open >/dev/null 2>&1; then
    open "$URL" >/dev/null 2>&1
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL" >/dev/null 2>&1
  elif command -v cmd.exe >/dev/null 2>&1; then
    cmd.exe /C start "" "$URL" >/dev/null 2>&1
  elif command -v powershell.exe >/dev/null 2>&1; then
    powershell.exe -NoProfile -Command "Start-Process '$URL'" >/dev/null 2>&1
  else
    return 1
  fi
}

PYTHON_CMD="$(find_python || true)"

if [[ -z "$PYTHON_CMD" ]]; then
  echo "Python est requis pour lancer le site localement."
  echo "Installez Python, puis relancez ce script."
  exit 1
fi

cd "$SCRIPT_DIR"

echo "Lancement du site sur ${URL}"
echo "Pour arreter le serveur : Ctrl+C"

open_browser || echo "Ouvrez cette adresse dans votre navigateur : ${URL}"

read -r -a PYTHON_PARTS <<< "$PYTHON_CMD"
exec "${PYTHON_PARTS[@]}" -m http.server "$PORT" --bind "$HOST"
