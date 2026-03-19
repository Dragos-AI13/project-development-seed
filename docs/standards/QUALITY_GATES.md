# Quality Gates

All gates marked as required in `docs/planning/PROJECT_PROFILE.yaml` must pass before merge.

## Local Gates

- Lint and formatting
- Unit tests
- Integration tests (for affected flows)
- Static analysis where configured

## CI Gates

- `CI` workflow green
- `Security Scan` workflow green (or documented approved exception)
- PR title semantic check
- Commit message check

## Release Gates

- `CHECKLISTS/pre-release.md` complete
- Rollback strategy validated
- Monitoring and alerting ready
