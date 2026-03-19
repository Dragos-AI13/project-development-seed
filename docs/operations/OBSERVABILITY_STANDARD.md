# Observability Standard

Define minimum telemetry for production readiness.

## Logs

- Structured logs only (JSON where possible)
- Include request/correlation IDs
- Never log secrets or sensitive personal data

## Metrics

- Request rate, error rate, latency (p95/p99)
- Queue depth/retry metrics for async workers
- DB query latency on critical paths

## Tracing (where available)

- Trace cross-service request chains
- Mark external dependency spans

## Alerting

- Alert on SLO breaches
- Alert on sustained error spikes
- Alert on critical background job failures

## Health and Metrics Endpoints (Release Readiness)
- Applications must expose a lightweight health endpoint (commonly `GET /health` or `GET /healthz`) that returns a successful HTTP status when the service is ready.
- Applications must expose a metrics endpoint (commonly `GET /metrics`) compatible with your chosen monitoring stack.
- Health/metrics endpoints must not require authentication and must not return sensitive data.
