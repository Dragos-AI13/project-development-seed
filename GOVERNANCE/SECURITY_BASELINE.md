# Security Baseline

## Mandatory Controls

- Authentication and authorization on protected resources
- Input validation and output sanitization
- Secrets management through environment/secret manager
- Structured logging without sensitive data
- Timeout and retry strategy for network/external calls
- Rate limiting for public endpoints and expensive operations

## Release Gate

No release if critical or high security issues are unresolved.
