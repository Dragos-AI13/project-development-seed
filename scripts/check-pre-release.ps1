param(
    [string]$ProjectRoot = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($ProjectRoot)) {
    # scripts/ -> project root
    $ProjectRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
}

$checklistPath = Join-Path $ProjectRoot "CHECKLISTS\pre-release.md"
$rollbackPath = Join-Path $ProjectRoot "docs\release\ROLLBACK_PLAYBOOK.md"
$observabilityPath = Join-Path $ProjectRoot "docs\operations\OBSERVABILITY_STANDARD.md"
$releaseStrategyPath = Join-Path $ProjectRoot "docs\release\RELEASE_STRATEGY.md"
$deploymentStandardPath = Join-Path $ProjectRoot "docs\release\DEPLOYMENT_STANDARD.md"

$requiredFiles = @(
    $checklistPath,
    $rollbackPath,
    $observabilityPath,
    $releaseStrategyPath,
    $deploymentStandardPath
)

foreach ($f in $requiredFiles) {
    if (-not (Test-Path -Path $f -PathType Leaf)) {
        throw "Missing required file: $f"
    }
}

$content = Get-Content -Path $checklistPath -Raw

# We can't reliably "prove" completion in a markdown checklist, but we can ensure required sections exist.
$requiredPhrases = @(
    "Version, changelog, and release notes prepared",
    "Database migrations validated",
    "Backup/restore path validated",
    "Monitoring and alerting configured",
    "Rollback plan documented and tested"
)

foreach ($phrase in $requiredPhrases) {
    if (-not $content.Contains($phrase)) {
        throw "Pre-release checklist missing phrase: '$phrase'"
    }
}

Write-Host "Pre-release checklist validation passed." -ForegroundColor Green
exit 0

