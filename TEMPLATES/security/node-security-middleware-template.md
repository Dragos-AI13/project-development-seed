# Node.js Security Middleware Template (Concept)

Goal: provide a consistent baseline for request correlation, structured errors, and security controls.

## Correlation ID Middleware
- Read `X-Request-Id` request header.
- If missing, generate a UUID.
- Attach correlation id to:
  - `res` response headers
  - request context accessible by later handlers
- Ensure error handler uses the same `request_id`.

## Structured Error Handler
- Always respond with JSON matching the structured error template.
- Ensure `request_id` is included for any error.
- Map errors to stable `code` values and HTTP status.

## Rate Limiting
- Apply on public routes before expensive operations.
- Return HTTP 429 with `code=RATE_LIMITED`.

## Security Notes
- Never return stack traces or raw exception messages.
- Never log tokens, credentials, or raw secret values.

