# Incident Runbook (Template)

Use this when something breaks in a way that impacts users or delivery.

## 0) Declare Severity

- Impacted users count / severity
- Scope: single feature vs system-wide
- Time sensitivity: can we wait or must we rollback now?

## 1) Stop the Bleeding

- If you have a safe rollback: rollback to last known good
- Reduce blast radius (disable feature flags, revoke risky access, throttle)

## 2) Collect Evidence (no guesswork)

- Check logs for request_id / correlation IDs
- Identify the first failing change (deployment or recent PR)
- Compare behavior against acceptance criteria expected outcome

## 3) Identify Root Cause Hypothesis

- Auth/AuthZ failure (unexpected access)
- Validation failure (bad inputs accepted)
- Integration failure (third-party or network)
- Performance/resource exhaustion
- Security control regression

## 4) Mitigate + Validate

- Implement minimal safe fix
- Add regression test for the incident scenario
- Update `docs/operations/RISK_REGISTER.md` and relevant ADR if needed

## 5) Post-Incident Review

- What happened and why (1-2 paragraphs)
- What we changed
- What will prevent recurrence (tests, gates, monitoring/alerts)
