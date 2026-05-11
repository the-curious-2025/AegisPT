# AegisPT

<div align="center">
<pre>
   _    _____ ____ ___ ____ ____ _____
  / \  | ____/ ___|_ _/ ___|  _ \_   _|
 / _ \ |  _|| |  _ | |\___ \ |_) || |
/ ___ \| |__| |_| || | ___) |  __/ | |
/_/   \_\_____\____|___|____/|_|    |_|
</pre>
<p><strong>Deterministic Pentest Orchestration for Kali Linux</strong></p>
<p>
  <a href="https://github.com/the-curious-2025/AegisPT/actions/workflows/ci.yml">
    <img alt="CI" src="https://github.com/the-curious-2025/AegisPT/actions/workflows/ci.yml/badge.svg" />
  </a>
  <a href="https://github.com/the-curious-2025/AegisPT/releases">
    <img alt="Releases" src="https://img.shields.io/github/v/release/the-curious-2025/AegisPT" />
  </a>
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/badge/license-MIT-green" />
  </a>
</p>
</div>

AegisPT is a non-LLM pentest workflow engine for operators who want repeatability, speed, and clean reporting.
It orchestrates reconnaissance and validation in deterministic stages, applies predefined rules, and preserves every run as a reusable session.

## Why AegisPT

- Deterministic behavior: same input, same flow.
- Human-controlled methodology: no autonomous AI decisions.
- Operator-first output: actionable findings plus structured artifacts.
- Built for Kali workflows: nmap, whatweb, nuclei.

## Core Capabilities

- Staged pipeline: recon -> enumeration -> validation -> reporting.
- Rule engine for follow-up actions and de-duplication.
- Session persistence and resume support.
- JSON export plus Markdown report generation.
- CLI-first operation with optional Docker usage.

## Quick Start

### Option 1: Fast install

```bash
git clone https://github.com/the-curious-2025/AegisPT.git
cd AegisPT
chmod +x scripts/quick_install.sh
./scripts/quick_install.sh
```

### Option 2: Manual install

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
chmod +x scripts/install_kali_deps.sh
./scripts/install_kali_deps.sh
```

## Operational Usage

```bash
# Web profile
aegispt run --target 10.10.10.10 --authorized --profile web

# Network profile
aegispt run --target 10.10.10.10 --authorized --profile network

# Resume and report
aegispt resume --session-id <SESSION_ID>
aegispt report --session-id <SESSION_ID>
```

Legacy alias remains available:

```bash
kali-autopentest run --target 10.10.10.10 --authorized --profile web
```

## One-Command Operator Flow

```bash
make install
make deps
make run-web TARGET=10.10.10.10
make run-net TARGET=10.10.10.10
make report SESSION=<SESSION_ID>
```

## Output Artifacts

- Session JSON: `~/.kali-autopentest/sessions/<session_id>.json`
- Report Markdown: `~/.kali-autopentest/reports/<session_id>.md`

## Docker

```bash
docker build -t aegispt:latest .
docker run --rm -it aegispt:latest --help
```

## Quality Gates

- CI on push and pull request.
- Python matrix testing.
- Ruff lint checks.
- Unit tests for rules, session store, and CLI contract.

Run locally:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .[dev]
ruff check .
pytest -q
```

## Release Workflow

- Changelog source: `CHANGELOG.md`
- Tag-driven release: `vX.Y.Z`
- Helper command:

```bash
make release VERSION=v0.1.2
git push origin v0.1.2
```

## Scope, Ethics, and Safety

- Use only on assets you own or have explicit written authorization to test.
- `--authorized` is required to run scans.
- This project is intended for legal security assessment, CTF, and lab environments.
- Operators are responsible for local laws, client rules of engagement, and data handling.
