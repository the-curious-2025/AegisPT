# AegisPT

<div align="center">
<pre>
   ___             _     ____ _____
   /   |  ___  ____(_)___/ __ \_   _|
  / /| | / _ \/ __/ / __/ /_/ / | |
 / ___ |/  __/ (_/ / /_/ ____/  | |
/_/  |_|\___/\__/_/\__/_/       |_|
</pre>
<p><strong>Deterministic Pentest Orchestrator for Kali Linux</strong></p>
</div>

This project automates repetitive penetration testing flow with deterministic logic:

- Stage engine: recon -> enumeration -> validation -> reporting
- Rule engine: predefined if-then decision logic
- Tool adapters: nmap, whatweb, nuclei
- Session persistence and resume support
- Markdown reporting and machine-readable JSON outputs

## Important

Use only on systems you own or are explicitly authorized to test.

## Quick Start

### Easy Install (Recommended)

```bash
git clone https://github.com/the-curious-2025/AegisPT.git
cd AegisPT
chmod +x scripts/quick_install.sh
./scripts/quick_install.sh
```

### Manual Install

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
chmod +x scripts/install_kali_deps.sh
./scripts/install_kali_deps.sh

aegispt run --target 10.10.10.10 --authorized --profile web
```

## CLI

```bash
aegispt run --target <TARGET> --authorized --profile web
aegispt run --target <TARGET> --authorized --profile network
aegispt resume --session-id <SESSION_ID>
aegispt report --session-id <SESSION_ID>
```

## One-Command Workflows

```bash
make install
make deps
make run-web TARGET=10.10.10.10
make run-net TARGET=10.10.10.10
make report SESSION=<SESSION_ID>
```

## Docker Workflow

```bash
docker build -t aegispt:latest .
docker run --rm -it aegispt:latest --help
```

Banner colors are enabled automatically in interactive terminals.
Set `NO_COLOR=1` to disable colored output.

Legacy command is still supported:

```bash
kali-autopentest run --target <TARGET> --authorized --profile web
```

## Professional Workflow (Kali)

1. Execute an initial autonomous pass:

```bash
aegispt run --target https://target.tld --authorized --profile web
```

2. Open generated report and execute only high-value suggested actions.
3. Re-run after every major finding confirmation to keep report and state updated.

This pattern reduces manual context switching and preserves clean audit evidence.

## Stack

- Python: orchestration engine and CLI
- Shell: installation/bootstrap scripts
- Makefile: repeatable local workflows
- Dockerfile: portable runtime container
- JSON/Markdown: rules and reports

## Level 2

- Automated CI on GitHub Actions (push + pull requests)
- Unit tests for core rule/session behaviors

Run tests locally:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e . pytest
pytest -q
```

## Safety Guardrails

- Requires explicit `--authorized` confirmation
- Designed for legal, authorized testing only
- Every run generates structured session artifacts for auditability

## Output Paths

- Sessions: `~/.kali-autopentest/sessions/<session_id>.json`
- Reports: `~/.kali-autopentest/reports/<session_id>.md`
