Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

$requiredFiles = @(
    "README.md",
    "LICENSE",
    "CODE_OF_CONDUCT.md",
    ".editorconfig",
    ".pre-commit-config.yaml",
    "docs/INDEX.md",
    "docs/core/START_HERE.md",
    "docs/core/AI_EXECUTION_CONTRACT.md",
    "docs/core/SEED_ADOPTION_GUIDE.md",
    "docs/planning/PROJECT_PROFILE.yaml",
    "docs/planning/DISCOVERY_QUESTIONS.md",
    "docs/standards/FEATURE_DEFINITION_STANDARD.md",
    "docs/standards/QUALITY_GATES.md",
    "docs/process/MASTER_LIFECYCLE.md",
    "docs/process/SESSION_HANDOFF_PROTOCOL.md",
    "docs/state/CURRENT_SESSION.md",
    "docs/state/PROJECT_STATUS.md",
    "docs/state/NEXT_ACTIONS.md",
    "docs/release/RELEASE_STRATEGY.md",
    "docs/release/ROLLBACK_PLAYBOOK.md",
    "docs/release/DEPLOYMENT_STANDARD.md",
    "scripts/check-pre-release.ps1",
    "scripts/deploy.ps1",
    "scripts/smoke-test.ps1"
)

$missing = @()
foreach ($file in $requiredFiles) {
    $full = Join-Path $root $file
    if (-not (Test-Path -Path $full -PathType Leaf)) {
        $missing += $file
    }
}

if ($missing.Count -gt 0) {
    Write-Host "Missing required files:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

$readmePath = Join-Path $root "README.md"
$readme = Get-Content -Path $readmePath -Raw
$checks = @(
    "docs/core/START_HERE.md",
    "docs/standards/FEATURE_DEFINITION_STANDARD.md",
    "docs/process/SESSION_HANDOFF_PROTOCOL.md",
    "docs/core/SEED_ADOPTION_GUIDE.md",
    "docs/process/MASTER_LIFECYCLE.md"
)
$missingRefs = @()
foreach ($c in $checks) {
    if (-not $readme.Contains($c)) {
        $missingRefs += $c
    }
}

if ($missingRefs.Count -gt 0) {
    Write-Host "README missing expected references:" -ForegroundColor Yellow
    $missingRefs | ForEach-Object { Write-Host "- $_" -ForegroundColor Yellow }
    exit 1
}

Write-Host "Seed validation passed." -ForegroundColor Green
exit 0
