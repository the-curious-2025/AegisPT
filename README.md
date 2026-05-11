# AegisPT (Deterministic, No AI)

```text
    ___             _     ____ _____
   /   |  ___  ____(_)___/ __ \_   _|
  / /| | / _ \/ __/ / __/ /_/ / | |
 / ___ |/  __/ (_/ / /_/ ____/  | |
/_/  |_|\___/\__/_/\__/_/       |_|
```

A professional terminal-first penetration testing orchestrator for Kali Linux.

This project automates repetitive penetration testing flow with deterministic logic:

- Stage engine: recon -> enumeration -> validation -> reporting
- Rule engine: predefined if-then decision logic
- Tool adapters: nmap, whatweb, nuclei
- Session persistence and resume support
- Markdown reporting and machine-readable JSON outputs

## Important

Use only on systems you own or are explicitly authorized to test.

## Quick Start

```bash
cd kali-autopentest
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

## Safety Guardrails

- Requires explicit `--authorized` confirmation
- Designed for legal, authorized testing only
- Every run generates structured session artifacts for auditability

## Output Paths

- Sessions: `~/.kali-autopentest/sessions/<session_id>.json`
- Reports: `~/.kali-autopentest/reports/<session_id>.md`
