# Seed Adoption Guide

Use this guide when copying this seed into a new repository.

## 1) Copy as-is (do not change initially)

- `docs/` structure and state documents
- `GOVERNANCE/` policies
- `.cursor/rules/`
- `.github/workflows/` quality and security pipelines
- `CHECKLISTS/`, `PLAYBOOKS/`, `TEMPLATES/`

Keep these unchanged in week 1 so delivery quality is stable from day one.

## 2) Must customize before first release

- `.github/CODEOWNERS` with real GitHub usernames
- `.github/ISSUE_TEMPLATE/config.yml` links (`OWNER/REPO`)
- `LICENSE` copyright holder/year if needed
- `docs/planning/PROJECT_PROFILE.yaml` with product-specific values
- `README.md` project description, setup and stack

## 3) CI strictness policy

Default policy in this seed is fail-on-error for lint, tests and security checks.
Relaxation is allowed only with an explicit temporary exception documented in:

- `docs/operations/RISK_REGISTER.md`
- `docs/state/DECISION_LOG.md`

Every exception must include owner, expiry date and rollback criteria.

## 4) Solo dev operating rhythm

- Start each work block from `docs/state/NEXT_ACTIONS.md`
- Update `docs/state/CURRENT_SESSION.md` during implementation
- Close each work block with:
  - decision updates in `docs/state/DECISION_LOG.md`
  - delta in `docs/state/PROJECT_STATUS.md`
  - next steps in `docs/state/NEXT_ACTIONS.md`

## 5) Definition of done for each merged change

- Tests added/updated and passing
- Security impact reviewed
- Observability impact reviewed (logs/metrics/alerts if applicable)
- Documentation updated in the same change
