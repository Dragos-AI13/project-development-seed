# Feature Definition Standard

Use this standard for every feature before implementation begins.

## 1) Context and Value

- Problem statement is explicit
- Target user and user impact are clear
- Business/technical value is measurable

## 2) Scope Boundaries

- In scope is documented
- Out of scope is documented
- Dependencies and assumptions are explicit

## 3) Functional Contract

- Inputs/outputs are defined
- API contract impact is documented (if applicable)
- Data model impact is documented (if applicable)

## 4) Security Requirements

- Auth/authz impact reviewed
- Input validation and sanitization requirements listed
- Rate limiting/abuse scenarios considered for exposed surfaces

## 5) Data and Migration Impact

- Schema changes identified
- Migration policy and rollback approach documented
- Data integrity checks identified

## 6) Test Requirements

- Required tests identified by level (unit/integration/e2e/security)
- Regression risk areas listed
- Minimum test set compliance confirmed

## 7) Observability and Ops

- Logging needs defined
- Metrics/alerts required for critical flows identified
- Incident impact and response notes included

## 8) Rollout and Release

- Rollout strategy selected (direct, staged, feature flag)
- Rollback plan documented
- Release notes impact identified

## 9) Documentation Impact

- State files to update identified (`docs/state/*`)
- Standards/ADR updates identified if design changes
- User-facing documentation updates identified (if needed)

## 10) Definition of Done Linkage

A feature is ready for implementation only when:
- `GOVERNANCE/DEFINITION_OF_READY.md` is satisfied
- this standard is completed

A feature is done only when:
- `GOVERNANCE/DEFINITION_OF_DONE.md` is satisfied
- `docs/standards/QUALITY_GATES.md` is satisfied
