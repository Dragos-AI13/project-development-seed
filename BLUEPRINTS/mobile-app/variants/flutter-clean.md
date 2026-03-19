# Variant: Flutter Clean Architecture

## Choose When

- You want single codebase mobile with stable UI behavior.
- You value consistent performance across platforms.

## Avoid When

- Existing team/assets are heavily JS/React centered.
- You need immediate deep native ecosystem reuse.

## Trade-offs

- Pros: consistent UI, predictable builds.
- Cons: Dart learning curve and ecosystem differences.

## Baseline Stack

- Flutter
- Feature-first module structure
- Dio/http client with retry + timeout policy
- Unit + widget + integration tests
