# Virtual Departments (Solo + AI)

In a solo setup, we emulate a full software company using "virtual departments".
Each department has responsibilities, inputs, and outputs that constrain the AI to behave deterministically.

## 1) Product

Responsibilities:
- Define the problem, users, MVP scope, and measurable success.

Inputs:
- `docs/planning/DISCOVERY_QUESTIONS.md`
- `docs/planning/PROJECT_PROFILE.yaml`

Outputs:
- MVP backlog (from `docs/planning/TASK_GENERATION_PLAYBOOK.md`)
- Acceptance criteria per task

## 2) Architecture

Responsibilities:
- Define system boundaries and choose patterns.
- Record trade-offs as ADRs.

Inputs:
- `docs/planning/PROJECT_PROFILE.yaml`
- existing `DECISIONS/*.md`

Outputs:
- ADRs in `DECISIONS/`
- module boundaries and dependency direction

## 3) Engineering

Responsibilities:
- Implement features following module/SRP boundaries.
- Use templates and keep changes small.

Inputs:
- blueprint skeletons in `BLUEPRINTS/*/skeleton`
- `.cursor/rules/*`

Outputs:
- working code changes + tests

## 4) QA / Testing

Responsibilities:
- Ensure correctness, regression coverage, and deterministic tests.

Inputs:
- acceptance criteria
- `GOVERNANCE/DEFINITION_OF_READY.md` and `GOVERNANCE/DEFINITION_OF_DONE.md`

Outputs:
- unit/integration tests evidence
- explicit gaps when testing is not feasible

## 5) Security

Responsibilities:
- Enforce authN/authZ, input validation, secrets policy, and safe logging.
- Ensure security requirements map to concrete controls.

Inputs:
- `docs/standards/SECURITY_REQUIREMENTS.md`
- `.cursor/rules/20-security.mdc`

Outputs:
- security notes per task
- threat-model-lite updates when necessary

## 6) DevOps / Release

Responsibilities:
- CI stability and required workflow gates.
- Release hygiene, rollback strategy, and operational readiness.

Inputs:
- `.github/workflows/*`
- `CHECKLISTS/pre-release.md`

Outputs:
- updated CI/security gates
- release notes/draft updates when relevant

## 7) Documentation / Governance

Responsibilities:
- Keep standards and decisions discoverable.
- Ensure RACI and readiness/done gates are respected.

Inputs:
- `GOVERNANCE/*`
- `TEMPLATES/*`

Outputs:
- ADR updates
- doc updates when behavior changes

## 8) Operations / Support

Responsibilities:
- Ensure observability and incident readiness.

Inputs:
- `docs/operations/RISK_REGISTER.md`
- `DECISIONS/ADR-0003-observability-baseline.md`

Outputs:
- runbooks and risk mitigations
