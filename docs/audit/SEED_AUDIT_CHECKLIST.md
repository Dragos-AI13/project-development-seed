# Seed Audit Checklist

Run this checklist after major seed updates.

## Structure Integrity

- [ ] `docs/INDEX.md` includes all major new documents
- [ ] `docs/core/START_HERE.md` references active process/docs
- [ ] No orphan critical docs outside intended folders

## Process Integrity

- [ ] `docs/process/SESSION_HANDOFF_PROTOCOL.md` aligns with `docs/state/*`
- [ ] `docs/process/SOLO_LINEAR_WORKFLOW.md` aligns with DoR/DoD
- [ ] Feature definition standard is enforced in startup flow

## Quality and Security Integrity

- [ ] Quality gates map to existing workflows
- [ ] Security policies map to scan workflows
- [ ] Test strategy matches minimum test set

## Release and Operations Integrity

- [ ] Release strategy and rollback playbook are present
- [ ] Observability standard includes logs/metrics/alerts
- [ ] Risk register and incident runbook are linked in process docs

## Examples Integrity

- [ ] Golden path examples contain profile, feature spec, task list, and state
- [ ] Example docs are consistent with current templates

## Final Result

- [ ] Audit completed with no critical gaps
- [ ] Exceptions documented in `docs/audit/COMPLIANCE_SCORECARD.md`
