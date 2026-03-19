# Session Handoff Protocol

Use this protocol to preserve continuity across independent chats.

## End of Session (mandatory)

1. Update `docs/state/PROJECT_STATUS.md`.
2. Update `docs/state/NEXT_ACTIONS.md`.
3. Update `docs/state/CHANGELOG_WORKING.md`.
4. Update `docs/state/CURRENT_SESSION.md`.
5. Update `docs/state/DECISION_LOG.md` for tactical decisions.
6. If architectural decision changed, add/update ADR in `DECISIONS/`.

## Start of New Session (mandatory)

1. Read `docs/core/START_HERE.md`.
2. Read `docs/state/CURRENT_SESSION.md`.
3. Read remaining files under `docs/state/`.
4. Read current task source (`docs/state/NEXT_ACTIONS.md`).
5. Produce a "Current State Summary" in 5-10 bullets.
6. Confirm the single next action before implementation.

## Hard Rule

If `docs/state/*` is stale or missing critical data, do not implement risky changes.
Ask for clarification and refresh state first.
