# Release Strategy

## Versioning

- Use semantic versioning (MAJOR.MINOR.PATCH).
- MAJOR for breaking changes, MINOR for backward-compatible features, PATCH for fixes.

## Release Types

- Regular release: planned and tested through full gates
- Hotfix release: minimal scope for urgent production issues

## Preconditions

- `docs/standards/QUALITY_GATES.md` satisfied
- `CHECKLISTS/pre-release.md` completed
- Rollback path validated

## CI/CD Deployment Baseline
- Deployment verification and optional deploy are handled by `.github/workflows/release.yml`.
- The repository contract for that workflow is documented in `docs/release/DEPLOYMENT_STANDARD.md`.
