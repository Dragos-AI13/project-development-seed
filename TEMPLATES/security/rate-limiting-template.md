# Rate Limiting Template

Goal: prevent abuse and control cost by limiting request frequency and burst.

## Baseline Requirements
- Apply rate limiting to public endpoints.
- Include correlation id (`request_id`) in logs and error responses.
- Return a stable error code (example: `RATE_LIMITED`) and HTTP `429`.
- Use safe defaults:
  - per-IP limit
  - burst limit where supported

## Algorithm (conceptual)
- Use a token bucket or leaky bucket strategy.
- Keying:
  - primary key: client IP (or forwarded IP, validated)
  - secondary key (optional): user id / API key when authenticated

## Integration Points
- Ingress middleware at the start of request handling.
- Store counters in fast shared storage if you run multiple instances (recommended).
- Propagate `X-Request-Id` so rate-limit events are traceable.

## Response on Limit Hit
Return structured error response with:
- `code`: `RATE_LIMITED`
- `message`: short statement like "Too many requests"
- `request_id`: correlation id

