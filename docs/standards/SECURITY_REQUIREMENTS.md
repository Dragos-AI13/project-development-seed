# Security Requirements

These requirements are mandatory unless an approved exception exists.

## Identity and Access

- Enforce authentication on protected resources
- Enforce authorization checks server-side
- Apply least privilege for service accounts and users

## Input and Output Safety

- Validate and sanitize all external input
- Escape or sanitize untrusted output rendered to users
- Store raw external tool output safely for debugging when needed

## Secrets and Data Protection

- Secrets only via environment variables or secret manager
- No secrets in repository, CI logs, or telemetry
- Encrypt sensitive data in transit and at rest where applicable

## Operational Security

- Apply rate limiting for public endpoints
- Set timeouts and resource caps for long-running tasks
- Log security-relevant events with safe redaction

## Security Testing Baseline

- Input validation abuse tests
- Authorization boundary tests
- Rate limiting behavior tests
- Dependency vulnerability checks in CI
