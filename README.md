# Project Development Seed

This repository is a reusable seed for starting software projects with a strong engineering baseline.

Use it when you want:
- Consistent architecture and folder structure
- Security-first implementation defaults
- Clear delivery workflow and quality gates
- Fast AI onboarding for project setup and execution

## Quick Start

1. Read `docs/core/START_HERE.md`.
2. Answer discovery questions from `docs/planning/DISCOVERY_QUESTIONS.md`.
3. Select stack using `docs/architecture/TECH_STACK_CATALOG.md` and `docs/architecture/TECH_DECISION_MATRIX.md`.
4. Pick one blueprint from `BLUEPRINTS/`.
5. Apply rules from `.cursor/rules/`.
6. Start implementation using `PLAYBOOKS/02-feature-delivery.md`.

## Enterprise Bootstrap (v2)

You can scaffold a new project from a blueprint skeleton with one command:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1
```

For non-interactive usage:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -ProjectType backend-api -TargetPath C:\work\my-api
```

## Enterprise Collaboration Pack (v3)

This seed now includes:

- `.github/CONTRIBUTING.md` for collaboration and quality expectations
- `.github/SECURITY.md` for vulnerability reporting and security baseline
- `.github/pull_request_template.md`
- `.github/ISSUE_TEMPLATE/*`
- `.github/workflows/ci.yml`
- `.github/workflows/security.yml`

Copy these into new repositories to keep delivery standards consistent from day one.

## Production Hardening Pack (v4)

This seed now includes:

- `.github/dependabot.yml` for dependency update automation
- `.github/CODEOWNERS` for review ownership policy
- `.github/release-drafter.yml` for changelog categories and release notes template
- `.github/workflows/release-drafter.yml` for automatic release draft updates
- `GOVERNANCE/BRANCH_PROTECTION_CHECKLIST.md` for branch protection baseline

## Quality Enforcement Pack (v5)

This seed now includes:

- `.github/ISSUE_TEMPLATE/config.yml` to disable blank issues and define contact channels
- `.github/labels.yml` with reusable label taxonomy
- `.github/workflows/labels-sync.yml` to keep labels consistent
- `.github/workflows/pr-title-semantic.yml` for semantic PR title validation
- `.github/workflows/commit-message-check.yml` for commit message linting
- `.commitlintrc.yml` baseline rules for commit conventions

## AI Operating System Pack (v6)

This seed now includes:

- `docs/planning/PROJECT_PROFILE.yaml` as mandatory project configuration contract
- `docs/core/AI_EXECUTION_CONTRACT.md` for deterministic AI behavior and delivery format
- `GOVERNANCE/DEFINITION_OF_READY.md`
- `docs/standards/API_STANDARDS.md`
- `docs/standards/SECURITY_REQUIREMENTS.md`
- `docs/standards/QUALITY_GATES.md`
- `docs/operations/RISK_REGISTER.md`
- `DECISIONS/ADR-0001-*.md` starter architecture decisions
- `docs/planning/TASK_GENERATION_PLAYBOOK.md` for backlog generation from discovery

## Virtual Departments Pack (v7)

This seed now includes:

- `docs/team/DEPARTMENTS_VIRTUAL.md` mapping solo+AI work into virtual departments
- `docs/team/RACI_SOLO_AI.md` clarifying who is responsible/accountable for key steps
- `docs/operations/SPRINT_CADENCE.md` recommended execution rhythm
- `docs/operations/INCIDENT_RUNBOOK.md` incident response template for operations readiness

## Continuity Pack (v8)

This seed now includes:

- `docs/state/PROJECT_STATUS.md`
- `docs/state/NEXT_ACTIONS.md`
- `docs/state/DECISION_LOG.md`
- `docs/state/KNOWN_ISSUES.md`
- `docs/state/CHANGELOG_WORKING.md`
- `docs/process/SOLO_LINEAR_WORKFLOW.md`
- `docs/process/SESSION_HANDOFF_PROTOCOL.md`

This pack is designed for multi-chat continuity where AI has no persistent conversation context.

## Production Excellence Pack (v9+)

This seed now includes:

- Stack governance: `docs/architecture/TECH_STACK_CATALOG.md`, `docs/architecture/TECH_DECISION_MATRIX.md`
- Architecture closure: `GOVERNANCE/DEFINITION_OF_ARCH_DONE.md`
- Data/migrations: `docs/standards/DATA_MODELING_GUIDE.md`, `docs/standards/MIGRATION_POLICY.md`
- API contract-first: `docs/process/API_CONTRACT_WORKFLOW.md`, `TEMPLATES/api/*`
- Feature standardization: `docs/standards/FEATURE_DEFINITION_STANDARD.md`, `TEMPLATES/feature-spec-template.md`
- Testing depth: `docs/testing/TEST_STRATEGY.md`, `docs/testing/MINIMUM_TEST_SET.md`
- Observability/SLOs: `docs/operations/OBSERVABILITY_STANDARD.md`, `docs/operations/SLO_SLI_TEMPLATE.md`, `docs/operations/ALERT_POLICY.md`
- Supply-chain security: `docs/security/SUPPLY_CHAIN_POLICY.md`, `docs/security/SECRETS_SCANNING_POLICY.md`
- Release lifecycle: `docs/release/RELEASE_STRATEGY.md`, `docs/release/ROLLBACK_PLAYBOOK.md`, `docs/release/FEATURE_FLAG_POLICY.md`
- Security workflows: `.github/workflows/secret-scan.yml`, `.github/workflows/codeql.yml`
- AI continuity prompts: `docs/ai/CHAT_BOOTSTRAP_PROMPT.md`, `docs/ai/CHAT_CLOSEOUT_PROMPT.md`
- Full navigation map: `docs/INDEX.md`

## Audit and Golden Paths Pack

This seed now includes:

- Audit controls: `docs/audit/SEED_AUDIT_CHECKLIST.md`, `docs/audit/COMPLIANCE_SCORECARD.md`
- Validation script: `scripts/validate-seed.ps1`
- Example implementations:
  - `examples/backend-api-golden-path/`
  - `examples/web-app-golden-path/`
- State dashboard:
  - `docs/state/KPIS.md`
  - `docs/state/QUALITY_TRENDS.md`
  - `docs/state/TECH_DEBT_BACKLOG.md`

## Hardening and Consistency Pack (v10)

This seed now includes:

- Baseline repository files: `LICENSE`, `CODE_OF_CONDUCT.md`, `.editorconfig`, `.pre-commit-config.yaml`
- Commit policy alignment: `.github/CONTRIBUTING.md` aligned with `.commitlintrc.yml` (Conventional Commits)
- Stricter quality/security gates in:
  - `.github/workflows/ci.yml`
  - `.github/workflows/security.yml`
- Adoption guidance: `docs/core/SEED_ADOPTION_GUIDE.md`

## Lifecycle Orchestration Pack (v11)

This seed now includes:

- End-to-end linear execution map: `docs/process/MASTER_LIFECYCLE.md`
- Clear stage gates for:
  - discovery and architecture closure
  - ready vs implementation vs verification
  - done vs release readiness vs operations
- Explicit prioritization rules for selecting the next feature

## Core Principle

The seed is designed to be copied into a new project and adapted with minimal friction.
Keep the structure, keep the quality gates, and customize only what is product-specific.
