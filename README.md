# AegisPT

<div align="center">
<pre>
    _    _____ ____ ___ ____ ____ _____
   / \  | ____/ ___|_ _/ ___|  _ \_   _|
  / _ \ |  _|| |  _ | |\___ \ |_) || |
 / ___ \| |__| |_| || | ___) |  __/ | |
/_/   \_\_____\____|___|____/|_|    |_|
</pre>
<p><strong>Fast, deterministic pentest orchestration for Kali Linux.</strong></p>
<p>
   <a href="https://github.com/the-curious-2025/AegisPT/actions/workflows/ci.yml">
      <img alt="CI" src="https://github.com/the-curious-2025/AegisPT/actions/workflows/ci.yml/badge.svg" />
   </a>
</p>
</div>

AegisPT is built for one thing: cutting repetitive manual workflow in recon and validation phases.
It does not rely on LLM decisions. It runs deterministic steps, applies rules, saves sessions, and produces clean reports.

## What It Does

- Runs staged flow: recon -> enumeration -> validation -> reporting
- Uses rule-based next actions (no AI planning layer)
- Integrates nmap, whatweb, and nuclei adapters
- Persists sessions for resume/report reuse
- Outputs structured JSON + Markdown report

## Quick Install

### Recommended

```bash
git clone https://github.com/the-curious-2025/AegisPT.git
cd AegisPT
chmod +x scripts/quick_install.sh
./scripts/quick_install.sh
```

### Manual

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
chmod +x scripts/install_kali_deps.sh
./scripts/install_kali_deps.sh
```

## Usage

```bash
aegispt run --target 10.10.10.10 --authorized --profile web
aegispt run --target 10.10.10.10 --authorized --profile network
aegispt resume --session-id <SESSION_ID>
aegispt report --session-id <SESSION_ID>
```

Legacy alias is still available:

```bash
kali-autopentest run --target 10.10.10.10 --authorized --profile web
```

## One-Command Workflows

```bash
make install
make deps
make run-web TARGET=10.10.10.10
make run-net TARGET=10.10.10.10
make report SESSION=<SESSION_ID>
```

## Docker

```bash
docker build -t aegispt:latest .
docker run --rm -it aegispt:latest --help
```

## Level 3 Quality

- CI on push + pull request
- Matrix test across Python versions
- Lint gate (ruff)
- Unit test suite for rules/session/CLI contracts

## Releases

- Changelog is tracked in CHANGELOG.md.
- Creating a Git tag like `v0.1.2` triggers the release workflow.
- The workflow builds wheel/sdist and publishes a GitHub Release with generated notes.
- The `make release VERSION=v0.1.2` helper validates the code, builds artifacts, and creates a local annotated tag.

Tag example:

```bash
make release VERSION=v0.1.2
git push origin v0.1.2
```

Run locally:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .[dev]
ruff check .
pytest -q
```

## Security Notes

- Use only on targets you own or are explicitly authorized to test.
- The tool requires explicit authorized flag in runtime commands.
- Session/report outputs are local under home directory.

Output paths:

- ~/.kali-autopentest/sessions/<session_id>.json
- ~/.kali-autopentest/reports/<session_id>.md
