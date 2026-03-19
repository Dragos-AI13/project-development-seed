# Rollback Playbook

## Trigger Conditions

- Critical regression in user-facing flow
- Security control failure
- Data integrity risk

## Rollback Steps

1. Stop rollout and freeze additional deploys
2. Rollback to last known stable release
3. Validate health checks and critical paths
4. Communicate incident status and next actions
5. Create follow-up fix task with regression tests
