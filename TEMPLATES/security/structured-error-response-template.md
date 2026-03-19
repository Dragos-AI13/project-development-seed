# Structured Error Response Template

Use this template to keep error responses consistent across services and easy to trace.

## Required Fields
- `code`: stable machine-readable error code (example: `VALIDATION_ERROR`)
- `message`: human-readable summary (no secrets)
- `request_id`: correlation id for tracing (typically from `X-Request-Id`)

Optional:
- `details`: array/object with validation errors or safe context

## Response Shape (JSON)
```json
{
  "code": "ERROR_CODE",
  "message": "Short explanation",
  "request_id": "uuid-or-correlation-id",
  "details": {}
}
```

## HTTP Status Mapping (baseline)
- 400: validation / malformed input
- 401: unauthenticated
- 403: unauthorized (policy denied)
- 404: not found
- 409: conflict
- 429: rate limited
- 500: internal error

## Implementation Notes
- Always return `request_id` even on unexpected failures.
- Never echo raw exception messages that could contain secrets.
- For validation errors, use stable field paths so frontend can map reliably.

