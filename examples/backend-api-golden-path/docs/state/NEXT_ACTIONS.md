# Next Actions

1. [ ] Implement `POST /v1/keys/rotate` endpoint
   - Done when: endpoint passes integration tests and authz checks

2. [ ] Add audit log event for key rotation
   - Done when: structured log contains actor, timestamp, key_id

3. [ ] Add regression tests for unauthorized access
   - Done when: tests fail if non-admin access is allowed
