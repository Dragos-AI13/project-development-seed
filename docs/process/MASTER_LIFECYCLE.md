# Master Lifecycle

This document is the single linear path for building software with this seed.
Use it as the default execution order from project start to production operation.

## Stage 0: Project Initialization

Entry criteria:

- Repository is created from this seed.
- Baseline files exist (`LICENSE`, `.editorconfig`, `.pre-commit-config.yaml`).

Actions:

- Read `docs/core/START_HERE.md`.
- Complete `docs/planning/PROJECT_PROFILE.yaml`.
- Apply `docs/core/SEED_ADOPTION_GUIDE.md`.

Exit criteria:

- Project profile is complete.
- Ownership, links and policy placeholders are customized.

## Stage 1: Discovery and Scope Framing

Entry criteria:

- Stage 0 complete.

Actions:

- Run `docs/planning/DISCOVERY_QUESTIONS.md`.
- Define bounded scope and explicit non-goals.
- Draft initial feature slices using `docs/planning/TASK_GENERATION_PLAYBOOK.md`.

Exit criteria:

- Scope is constrained and testable.
- Initial ordered feature list exists in `docs/state/NEXT_ACTIONS.md`.

## Stage 2: Architecture and Decision Closure

Entry criteria:

- Discovery artifacts exist.

Actions:

- Select stack via `docs/architecture/TECH_STACK_CATALOG.md` and `docs/architecture/TECH_DECISION_MATRIX.md`.
- Write/approve ADRs under `DECISIONS/`.
- Confirm architecture closure with `GOVERNANCE/DEFINITION_OF_ARCH_DONE.md`.

Exit criteria:

- Critical architecture decisions are documented.
- No blocking unknowns remain for first implementation slice.

## Stage 3: Ready Gate per Feature

Entry criteria:

- Next feature candidate is identified.

Actions:

- Validate against `GOVERNANCE/DEFINITION_OF_READY.md`.
- If needed, write/update feature spec from `TEMPLATES/feature-spec-template.md`.
- If API change is required, apply `docs/process/API_CONTRACT_WORKFLOW.md` first.
- If DB change is required, apply `docs/standards/MIGRATION_POLICY.md`.

Exit criteria:

- Feature is unambiguous, scoped and testable.
- Acceptance criteria and test plan are explicit.

## Stage 4: Implementation (One Vertical Slice)

Entry criteria:

- Feature passed Ready Gate.

Actions:

- Follow `.cursor/rules/` and `GOVERNANCE/ENGINEERING_STANDARDS.md`.
- Implement one vertical slice only.
- Respect standards in:
  - `docs/standards/API_STANDARDS.md`
  - `docs/standards/SECURITY_REQUIREMENTS.md`
  - `docs/standards/FEATURE_DEFINITION_STANDARD.md`

Exit criteria:

- Code for the slice is complete and locally verifiable.

## Stage 5: Verification and Quality Gates

Entry criteria:

- Implementation complete for current slice.

Actions:

- Run tests using `docs/testing/TEST_STRATEGY.md` and `docs/testing/MINIMUM_TEST_SET.md`.
- Apply `docs/standards/QUALITY_GATES.md`.
- Review observability impact with `docs/operations/OBSERVABILITY_STANDARD.md`.
- Review risk and security impact (`docs/operations/RISK_REGISTER.md`, `GOVERNANCE/SECURITY_BASELINE.md`).

Exit criteria:

- Quality and security gates pass.
- No untracked risk for this slice remains.

## Stage 6: Documentation and Decision Updates

Entry criteria:

- Verification passed.

Actions:

- Update:
  - `docs/state/PROJECT_STATUS.md`
  - `docs/state/CHANGELOG_WORKING.md`
  - `docs/state/DECISION_LOG.md` (if a decision changed)
- Update or add ADR if architecture changed.

Exit criteria:

- Technical and operational context is current.

## Stage 7: Done Gate and Release Readiness

Entry criteria:

- Documentation updates complete.

Actions:

- Validate `GOVERNANCE/DEFINITION_OF_DONE.md`.
- Prepare release process with:
  - `docs/release/RELEASE_STRATEGY.md`
  - `docs/release/FEATURE_FLAG_POLICY.md`
  - `docs/release/ROLLBACK_PLAYBOOK.md`

Exit criteria:

- Slice is release-ready with rollback strategy.

## Stage 8: Operate, Observe, and Learn

Entry criteria:

- Slice is released or deployed to target environment.

Actions:

- Monitor alerts and SLO behavior:
  - `docs/operations/SLO_SLI_TEMPLATE.md`
  - `docs/operations/ALERT_POLICY.md`
  - `docs/operations/INCIDENT_RUNBOOK.md`
- Record incidents, regressions and improvement actions.

Exit criteria:

- Production behavior is understood.
- Follow-up tasks are captured.

## Stage 9: Select the Next Feature

Entry criteria:

- Current slice is closed.

Prioritization rules:

1. Security and reliability risks first.
2. Blockers for current roadmap second.
3. Highest user/business impact third.
4. Lowest implementation uncertainty for next quick win.

Actions:

- Promote exactly one next action in `docs/state/NEXT_ACTIONS.md`.
- Keep execution linear through `docs/process/SOLO_LINEAR_WORKFLOW.md`.

Exit criteria:

- One clear next feature is selected with explicit acceptance criteria.

---

If any stage fails, do not advance. Resolve the failure in the same stage, then continue.
