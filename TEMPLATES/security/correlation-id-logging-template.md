# Correlation ID + Structured Logging Template

Goal: every log line and every error response must include the same correlation identifier to connect requests, traces, and alerts.

## Correlation ID Source
- Prefer `X-Request-Id` header from the caller.
- If missing, generate a UUID server-side.

## Propagation Rules
- Put `X-Request-Id` value on the response headers.
- Ensure the value is available to:
  - request handlers
  - error handlers / exception middleware
  - background jobs spawned from the request (pass explicitly)

## Structured Log Fields (minimum)
- `timestamp`
- `level`
- `service`
- `environment`
- `request_id`
- `method`
- `path`
- `status_code`
- `duration_ms`

## Security Notes
- Never log secrets or tokens.
- Redact sensitive headers and fields (e.g. `Authorization`, `Cookie`, passwords).

