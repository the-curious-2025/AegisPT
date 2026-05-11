# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog, and this project follows Semantic Versioning.

## [0.1.0] - 2026-05-11

### Added
- Deterministic, non-AI pentest orchestration engine with staged execution.
- CLI interface via `aegispt` and backward-compatible `kali-autopentest` entrypoint.
- Tool adapters for `nmap`, `whatweb`, and `nuclei`.
- Rule-based follow-up recommendations and action deduplication.
- Session persistence and Markdown report generation.
- Kali helper scripts, Docker support, and Makefile automation.
- CI pipeline with linting and Python matrix tests.

### Security
- Basic repository hygiene for generated artifacts and cache files via `.gitignore`.
