#!/usr/bin/env bash
set -euo pipefail

version="${1:-}"

if [[ -z "$version" ]]; then
  echo "usage: $0 vX.Y.Z"
  exit 1
fi

if [[ ! "$version" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "[!] version must match vX.Y.Z"
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "[!] python3 is required"
  exit 1
fi

python3 -m py_compile pentest_orchestrator/cli.py

if ! python3 -m pytest -q >/dev/null 2>&1; then
  echo "[!] tests failed; fix them before releasing"
  exit 1
fi

python3 -m build >/dev/null 2>&1

if git rev-parse --verify "$version" >/dev/null 2>&1; then
  echo "[!] tag already exists: $version"
  exit 1
fi

git tag -a "$version" -m "Release $version"

echo "[+] Created local annotated tag $version"
echo "[+] Push with: git push origin $version"
echo "[+] GitHub Actions release workflow will publish the release after the push"
