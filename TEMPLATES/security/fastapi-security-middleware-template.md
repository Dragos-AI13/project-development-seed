# FastAPI Security Middleware Template (Concept)

This template describes the minimum middleware/exception wiring expected for the seed baseline.

## Correlation ID Middleware
- Read `X-Request-Id` header.
- If missing, generate a UUID.
- Set `X-Request-Id` in the response headers.
- Make the value available to:
  - request handlers (request state)
  - exception handlers (so errors include `request_id`)

## Structured Error Handling
- Convert validation errors into stable error payloads:
  - HTTP 400
  - `code=VALIDATION_ERROR`
  - `request_id` included
- Convert auth/permission errors:
  - HTTP 401/403
  - `code=UNAUTHENTICATED` / `UNAUTHORIZED`
- Convert unexpected exceptions:
  - HTTP 500
  - `code=INTERNAL_ERROR`
  - log exception internally, do not leak secrets to clients

## Rate Limiting
- Apply before expensive work.
- When limit is reached, return HTTP 429 with `code=RATE_LIMITED`.

## Pseudocode (high-level)
1. Request enters middleware.
2. Correlation id is attached to request context.
3. Authentication/authorization dependencies run (or are invoked by route).
4. If error occurs, exception handler builds structured response with `request_id`.

