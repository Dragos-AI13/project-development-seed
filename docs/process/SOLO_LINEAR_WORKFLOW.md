# Solo Linear Workflow

This workflow enforces deterministic execution and minimizes context drift.

## Step 1: Intake

- Capture user request or feature intent.
- Link it to one concrete expected outcome.
- Confirm stack/architecture decisions are current.

## Step 2: Ready Check

- Validate against `GOVERNANCE/DEFINITION_OF_READY.md`.
- If not ready, do not start coding.

## Step 3: Plan One Vertical Slice

- Pick only one action from `docs/state/NEXT_ACTIONS.md`.
- Define acceptance criteria and test plan before coding.
- If API or schema changes are involved, apply contract/migration workflows first.

## Step 4: Implement

- Keep changes small and module-scoped.
- Avoid speculative work outside current slice.

## Step 5: Verify

- Run applicable tests.
- Apply `docs/standards/QUALITY_GATES.md`.
- Validate observability and release impact for production-facing changes.
- **Regression Check (Critic RUN 2)**: După implementare, Critic rulează un al doilea review care verifică:
  - Toate issue-urile din RUN 1 sunt rezolvate
  - Bug-urile raportate anterior sunt confirmate reparate
  - Nu s-au introdus regresiuni în zone adiacente
  - Documentează rezultatul în `docs/state/QUALITY_TRENDS.md`

## Step 6: Document

- Update `docs/state/PROJECT_STATUS.md`.
- Update `docs/state/CHANGELOG_WORKING.md`.
- Update `docs/state/DECISION_LOG.md` when needed.

## Step 7: Close Slice

- Confirm `GOVERNANCE/DEFINITION_OF_DONE.md`.
- Mark action completed in `docs/state/NEXT_ACTIONS.md`.

## Step 8: Select Next Slice

- Promote exactly one next action.
- Keep execution linear and explicit.
