#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y nmap whatweb

if ! command -v nuclei >/dev/null 2>&1; then
  echo "[+] Installing nuclei via go"
  sudo apt install -y golang-go
  GOBIN="${HOME}/go/bin" go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
  echo "[+] If needed, add to PATH: export PATH=\"$HOME/go/bin:$PATH\""
fi

echo "[+] Dependency installation completed"
