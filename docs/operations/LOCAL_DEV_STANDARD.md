# Local Dev Standard

This document defines the minimum contract that seed-derived projects should implement so developers (and AI agents) can run common tasks consistently.

## Supported Commands
Seed-derived repos should include:
- `scripts/dev.ps1`
- `scripts/lint.ps1`
- `scripts/test.ps1`

The scripts use a safe “override by env var” contract:
- `DEV_COMMAND` (optional): overrides `scripts/dev.ps1`
- `LINT_COMMAND` (optional): overrides `scripts/lint.ps1`
- `TEST_COMMAND` (optional): overrides `scripts/test.ps1`

Additionally, seed-derived projects can provide hook scripts for full framework freedom:
- `scripts/dev.hook.ps1` (optional): runs before any detection logic
- `scripts/lint.hook.ps1` (optional): runs before any detection logic
- `scripts/test.hook.ps1` (optional): runs before any detection logic

## Default Detection (when env vars are NOT set)
- If `docker-compose.yml` exists: `scripts/dev.ps1` runs `docker compose up --build`.
- If `package.json` exists: it runs `npm/yarn/pnpm` dev/lint/test scripts based on lockfiles.
- If `pyproject.toml` or `requirements.txt` exists: `scripts/dev.ps1` runs `uvicorn --reload` and requires:
  - `UVICORN_APP` (e.g. `app.main:app`)

## Health/Readiness for local loops
- Implement `GET /health` (or `/healthz`) and `GET /metrics` so smoke tests and release readiness can run.

