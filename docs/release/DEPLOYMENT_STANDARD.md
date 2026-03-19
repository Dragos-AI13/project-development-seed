# Deployment Standard

This document defines the minimum contract required by the seed's CI/CD baseline workflow: `.github/workflows/release.yml`.

## Required Repository Secrets (for automated deploy)
- `DEPLOY_COMMAND` (string, optional): if set (non-empty), the workflow will execute `scripts/deploy.ps1` during release publish.

## Optional Smoke Test URLs
- `SMOKE_HEALTH_URL` (string, optional): endpoint expected to return a successful HTTP status (typically `200`) for application health.
- `SMOKE_METRICS_URL` (string, optional): endpoint expected to return metrics for production readiness (commonly `/metrics`).

## Default Behavior (Fail-Safe)
- If `DEPLOY_COMMAND` is not set, the workflow performs only verification steps (lint/tests + dependency and secret audits) and skips deployment.

## Rollback
- Rollback steps are documented in `docs/release/ROLLBACK_PLAYBOOK.md` and must be validated as part of the `CHECKLISTS/pre-release.md` requirements.

