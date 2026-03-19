# Feature Spec: API Key Rotation Endpoint

## Context

- Problem: static API keys are long-lived and increase breach impact.
- User impact: admin users can rotate keys safely.
- Expected value: reduced security risk and better auditability.

## Scope

- In scope: create rotate endpoint, invalidate old key, audit event.
- Out of scope: UI dashboard changes.
- Dependencies: auth module, key storage service.

## Security Notes

- Admin-only authorization.
- Input validation on request payload.
- Rate limit rotate endpoint to prevent abuse.

## Testing Plan

- Unit: authorization guard, key rotation service behavior.
- Integration: rotate endpoint success + failure cases.
- Security: unauthorized and forbidden paths.
