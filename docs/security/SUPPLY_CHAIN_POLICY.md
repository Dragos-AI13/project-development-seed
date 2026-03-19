# Supply Chain Security Policy

## Dependency Rules

- Pin dependencies via lockfiles.
- Prefer maintained libraries with active security posture.
- Remove unused dependencies regularly.

## CI Controls

- Dependency audit runs in CI.
- High/critical vulnerabilities require triage before merge.
- Exceptions must be documented with expiry date.
- Dependency changes introduced by PRs are reviewed via `actions/dependency-review-action` (seed baseline).

## Artifact Integrity

- Verify source integrity where possible.
- Use trusted registries and avoid unknown mirrors.
