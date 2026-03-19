# Error Codes Registry

Use stable machine-readable codes.

| Code | HTTP | Meaning | Owner |
|---|---:|---|---|
| VALIDATION_ERROR | 400 | Input validation failed | API |
| UNAUTHENTICATED | 401 | Missing/invalid authentication | Security |
| UNAUTHORIZED | 403 | Access denied by policy | Security |
| NOT_FOUND | 404 | Resource not found | API |
| CONFLICT | 409 | Conflicting state | API |
| RATE_LIMITED | 429 | Too many requests | Platform |
| INTERNAL_ERROR | 500 | Unexpected server failure | Platform |
