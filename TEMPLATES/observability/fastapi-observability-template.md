# FastAPI Observability Template

## Goals
- Structured logs (no secrets, include request/correlation id).
- Prometheus-style metrics endpoint at `GET /metrics`.
- Optional OpenTelemetry tracing (OTLP export).

## Correlation ID (request/response)
Adopt `X-Request-Id` as the source of correlation id.
- If the header exists, reuse it.
- Otherwise, generate a new uuid and set it on the response.

## Metrics (`/metrics`)
Use `prometheus_client` to expose:
- request count
- request duration histogram
- error count

Ensure your `/metrics` handler does not leak secrets and is callable by the monitoring stack.

## Tracing (optional)
Use OpenTelemetry SDK and instrument:
- incoming HTTP requests
- outbound calls (where supported)

Export traces via OTLP to your collector:
- `OTEL_EXPORTER_OTLP_ENDPOINT`
- `OTEL_SERVICE_NAME`
- propagate context across async boundaries

## Environment Variables (typical)
See `otel-export-env-vars.md` for a safe baseline.

