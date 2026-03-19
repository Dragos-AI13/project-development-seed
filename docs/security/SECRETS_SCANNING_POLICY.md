# Secrets Scanning Policy

## Rules

- No secrets in source code, tests, fixtures, or docs.
- No secrets in CI logs or error traces.
- `.env.example` is allowed, `.env` is never committed.

## Controls

- Run secret scanning in CI on push and PR.
- Block merge on detected live credentials.
- Rotate and revoke leaked credentials immediately.

## Incident Handling

- Record incident in runbook/changelog.
- Document prevention action to avoid recurrence.
