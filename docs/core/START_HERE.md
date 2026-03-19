# START HERE

This is the first file both humans and AI agents should read.

## Mission

Create production-ready software projects with consistent standards, security controls, and delivery discipline.

## First Steps

1. Fill `docs/planning/PROJECT_PROFILE.yaml` with project-specific decisions.
2. Confirm project type (`web-app`, `mobile-app`, `desktop-app`, `backend-api`, `fullstack-saas`).
3. Answer all items in `docs/planning/DISCOVERY_QUESTIONS.md`.
4. Initialize state files in `docs/state/` before coding.
5. Generate project skeleton using `scripts/init-project.ps1` or manually copy from `BLUEPRINTS/*/skeleton`.
6. Run stack selection using `docs/architecture/TECH_STACK_CATALOG.md` + `docs/architecture/TECH_DECISION_MATRIX.md`.
7. Enforce rules from `.cursor/rules/` and read `docs/core/AI_EXECUTION_CONTRACT.md`.
8. Follow contract and migration workflow in `docs/process/API_CONTRACT_WORKFLOW.md` and `docs/standards/MIGRATION_POLICY.md`.
9. Define each feature using `docs/standards/FEATURE_DEFINITION_STANDARD.md` and `TEMPLATES/feature-spec-template.md`.
10. Follow testing strategy from `docs/testing/TEST_STRATEGY.md` and `docs/testing/MINIMUM_TEST_SET.md`.
11. Apply observability and release standards from `docs/operations/*` and `docs/release/*`.
12. Copy collaboration pack from `.github/`, `.github/CONTRIBUTING.md`, and `.github/SECURITY.md`.
13. Apply hardening assets: `dependabot`, `CODEOWNERS`, branch protection, secret scan, and CodeQL workflows.
14. Follow `PLAYBOOKS/01-project-bootstrap.md`, `docs/planning/TASK_GENERATION_PLAYBOOK.md`, and `docs/process/SOLO_LINEAR_WORKFLOW.md`.
15. Enforce handoff with `docs/process/SESSION_HANDOFF_PROTOCOL.md`.
16. Track risks in `docs/operations/RISK_REGISTER.md` and enforce `docs/standards/QUALITY_GATES.md`.
17. Follow virtual department model in `docs/team/DEPARTMENTS_VIRTUAL.md` and RACI in `docs/team/RACI_SOLO_AI.md`.
18. Run seed health checks with `scripts/validate-seed.ps1` and `docs/audit/SEED_AUDIT_CHECKLIST.md` after major updates.

## Non-Negotiables

- Security first and fail secure
- Explicit, testable architecture decisions
- No sensitive data in code or logs
- Quality gates before merge and release
