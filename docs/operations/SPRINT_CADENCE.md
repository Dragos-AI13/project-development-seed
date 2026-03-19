# Sprint Cadence (Solo Dev + AI)

Choose a cadence that matches your pace. Default: weekly micro-sprints.

## Weekly Loop (recommended)

1. **Plan (20-30 min)**
   - Fill `docs/planning/PROJECT_PROFILE.yaml` (if needed)
   - Review top MVP tasks from `docs/planning/TASK_GENERATION_PLAYBOOK.md`
   - Mark 1-3 tasks for implementation in this sprint

2. **Build (time-boxed)**
   - Implement tasks one by one in vertical slices
   - Keep changes small and modular

3. **Quality + Security Pass (mandatory)**
   - Run local tests for task scope
   - Ensure gates in `docs/standards/QUALITY_GATES.md`
   - Update `docs/operations/RISK_REGISTER.md` for any new high-impact risk

4. **Review and Approve (you)**
   - Validate behavior and acceptance criteria
   - Confirm no secrets/sensitive data are leaked

5. **Release prep (when ready)**
   - Validate `CHECKLISTS/pre-release.md`
   - Update docs/ADR as needed

## Daily Habits (lightweight)

- Before coding: check `GOVERNANCE/DEFINITION_OF_READY.md` for the task
- After coding: ensure `GOVERNANCE/DEFINITION_OF_DONE.md` is satisfied
