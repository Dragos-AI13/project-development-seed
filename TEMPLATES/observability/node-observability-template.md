# Node.js Observability Template (Express/Fastify-style)

## Goals
- Structured logs (JSON) with correlation ID.
- `/health` and `/metrics` endpoints.
- Optional OpenTelemetry tracing.

## Correlation ID
Adopt `X-Request-Id`.
- If request contains `X-Request-Id`, reuse it.
- Otherwise generate a new uuid.
- Add the value to the response headers.
- Include it in every log line for the request.

## Metrics (`/metrics`)
Expose Prometheus-compatible output.
- Use a Prometheus client library for Node.
- Instrument:
  - request count
  - request duration (histogram)
  - error count

## Health (`/health`)
Return success when dependencies needed for readiness are available.
- Keep it lightweight.
- Do not include sensitive data.

## Tracing (optional)
Instrument HTTP server and export to OTLP-compatible collector.
- Use OpenTelemetry SDK
- Configure via:
  - `OTEL_EXPORTER_OTLP_ENDPOINT`
  - `OTEL_SERVICE_NAME`

