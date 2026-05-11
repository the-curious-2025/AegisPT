#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "[!] python3 is required"
  exit 1
fi

if ! command -v pipx >/dev/null 2>&1; then
  echo "[+] Installing pipx"
  sudo apt update
  sudo apt install -y pipx
fi

pipx ensurepath
pipx install --force .

chmod +x scripts/install_kali_deps.sh
./scripts/install_kali_deps.sh

echo "[+] Installation complete"
echo "[+] Run: aegispt run --target <TARGET> --authorized --profile web"
