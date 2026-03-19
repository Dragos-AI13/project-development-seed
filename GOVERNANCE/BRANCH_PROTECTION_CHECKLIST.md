# Branch Protection Checklist

Apply these settings on `main` for each generated project repository.

## Required Checks

- [ ] Require pull request before merging
- [ ] Require at least 1-2 approving reviews
- [ ] Dismiss stale approvals when new commits are pushed
- [ ] Require conversation resolution before merge
- [ ] Require status checks to pass (`CI`, `Security Scan`)
- [ ] Require branch to be up to date before merging

## Access Control

- [ ] Restrict direct pushes to `main`
- [ ] Restrict force pushes
- [ ] Restrict branch deletion

## Optional Hardening

- [ ] Require signed commits
- [ ] Require linear history
- [ ] Require CODEOWNERS review for protected paths
