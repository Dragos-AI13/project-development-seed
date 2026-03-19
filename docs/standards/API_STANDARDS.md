# API Standards

Use these standards for all public and internal APIs.

## Request Validation

- Validate all request payloads and query params
- Reject invalid input with explicit error codes
- Sanitize user-provided strings before processing

## Response Shape

- Success responses should be consistent per endpoint family
- Error responses must include:
  - `code` (stable machine-readable)
  - `message` (human-readable)
  - `request_id` (for tracing)

## Error Model

- 400 for validation errors
- 401 for unauthenticated requests
- 403 for unauthorized requests
- 404 for not found
- 409 for conflict
- 429 for rate limiting
- 500 for unexpected internal errors

## Pagination and Filtering

- Use cursor-based pagination where possible
- Document defaults and maximum limits
- Expose filtering only on indexed/safe fields

## Idempotency

- Require idempotency keys on side-effect-heavy endpoints (payments, retries, jobs)
