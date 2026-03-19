# AI Execution Contract

This contract defines how an AI agent must operate in this seed and any project derived from it.

## Mandatory Startup Sequence

1. Read `docs/core/START_HERE.md`.
2. Read `.cursor/rules/*`.
3. Read `docs/state/CURRENT_SESSION.md`.
4. Read `docs/state/PROJECT_STATUS.md`.
5. Read `docs/state/NEXT_ACTIONS.md`.
6. Read `docs/state/KNOWN_ISSUES.md`.
7. Read `docs/planning/PROJECT_PROFILE.yaml`.
8. Ask missing items from `docs/planning/DISCOVERY_QUESTIONS.md`.
9. Select the correct blueprint and confirm scope before coding.
10. Confirm chosen stack is documented via `docs/architecture/TECH_DECISION_MATRIX.md`.

## Context Integrity Rules

- If `docs/state/*` does not provide enough context for safe implementation, stop and ask for clarification.
- Do not guess scope, acceptance criteria, or architectural intent.
- Before coding, provide a short "Current State Summary" based on `docs/state/*`.

## Clarification Rules

The AI must ask for clarification when:
- acceptance criteria are ambiguous
- security impact is unclear
- data model assumptions are missing
- external integration contracts are unknown

The AI can proceed without blocking only for low-risk implementation details.

## Delivery Rules Per Iteration

For every implementation iteration, AI must provide:
- short execution plan
- concrete code changes
- test evidence (or explicit test gap)
- risk notes and follow-up actions
- explicit proposed updates for `docs/state/PROJECT_STATUS.md` and `docs/state/NEXT_ACTIONS.md`

## Guardrails

- Never bypass security controls for convenience.
- Never assume authorization from frontend-only constraints.
- Never add secrets in code, tests, docs, or logs.
- Never ship without quality gates required by profile/config.

## Completion Conditions

A task is not complete unless both are satisfied:
- `GOVERNANCE/DEFINITION_OF_DONE.md`
- all required checks in `docs/standards/QUALITY_GATES.md`
- handoff updates in `docs/state/` are complete (`PROJECT_STATUS`, `NEXT_ACTIONS`, `CHANGELOG_WORKING`)

Architecture-impacting changes also require:
- `GOVERNANCE/DEFINITION_OF_ARCH_DONE.md`
