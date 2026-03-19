param(
    [string]$TargetPath = "",
    [string]$ProjectType = "",
    [bool]$WithSeedAssets = $true
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$seedRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

$projectMap = @{
    "web-app"       = "BLUEPRINTS/web-app/skeleton"
    "mobile-app"    = "BLUEPRINTS/mobile-app/skeleton"
    "desktop-app"   = "BLUEPRINTS/desktop-app/skeleton"
    "backend-api"   = "BLUEPRINTS/backend-api/skeleton"
    "fullstack-saas"= "BLUEPRINTS/fullstack-saas/skeleton"
}

function Read-RequiredInput {
    param([string]$PromptText)
    do {
        $value = Read-Host $PromptText
    } while ([string]::IsNullOrWhiteSpace($value))
    return $value.Trim()
}

function Select-ProjectType {
    Write-Host ""
    Write-Host "Select project type:" -ForegroundColor Cyan
    $keys = @($projectMap.Keys | Sort-Object)
    for ($i = 0; $i -lt $keys.Count; $i++) {
        Write-Host "[$($i + 1)] $($keys[$i])"
    }
    Write-Host ""
    do {
        $pick = Read-Host "Type number (1-$($keys.Count))"
        $parsed = 0
        $ok = [int]::TryParse($pick, [ref]$parsed)
        if ($ok -and $parsed -ge 1 -and $parsed -le $keys.Count) {
            return $keys[$parsed - 1]
        }
        Write-Host "Invalid selection. Try again." -ForegroundColor Yellow
    } while ($true)
}

if ([string]::IsNullOrWhiteSpace($ProjectType)) {
    $ProjectType = Select-ProjectType
}

if (-not $projectMap.ContainsKey($ProjectType)) {
    throw "Unknown project type '$ProjectType'. Allowed: $($projectMap.Keys -join ', ')."
}

if ([string]::IsNullOrWhiteSpace($TargetPath)) {
    $TargetPath = Read-RequiredInput "Target folder path for new project"
}

$targetFullPath = [System.IO.Path]::GetFullPath($TargetPath)
$skeletonRel = $projectMap[$ProjectType]
$skeletonFullPath = Join-Path $seedRoot $skeletonRel

if (-not (Test-Path -Path $skeletonFullPath -PathType Container)) {
    throw "Skeleton path not found: $skeletonFullPath"
}

if (-not (Test-Path -Path $targetFullPath)) {
    New-Item -Path $targetFullPath -ItemType Directory | Out-Null
}

$targetItems = Get-ChildItem -Path $targetFullPath -Force -ErrorAction SilentlyContinue
if ($targetItems.Count -gt 0) {
    throw "Target folder is not empty: $targetFullPath"
}

Copy-Item -Path (Join-Path $skeletonFullPath "*") -Destination $targetFullPath -Recurse -Force

if ($WithSeedAssets) {
    Write-Host "Bootstrapping seed assets into target..." -ForegroundColor Cyan

    function Copy-If-Exists {
        param(
            [Parameter(Mandatory = $true)]
            [string]$Source,
            [Parameter(Mandatory = $true)]
            [string]$Destination
        )

        if (Test-Path -Path $Source) {
            # Ensure destination parent exists (PowerShell is picky about missing parents).
            $parent = Split-Path -Parent $Destination
            if (-not (Test-Path -Path $parent)) {
                New-Item -Path $parent -ItemType Directory | Out-Null
            }

            $isDir = Test-Path -Path $Source -PathType Container
            if ($isDir) {
                Copy-Item -Path $Source -Destination $Destination -Recurse -Force
            }
            else {
                Copy-Item -Path $Source -Destination $Destination -Force
            }
        }
    }

    # Repository quality gates + collaboration files
    Copy-If-Exists -Source (Join-Path $seedRoot ".github") -Destination (Join-Path $targetFullPath ".github")
    Copy-If-Exists -Source (Join-Path $seedRoot "CHECKLISTS") -Destination (Join-Path $targetFullPath "CHECKLISTS")
    Copy-If-Exists -Source (Join-Path $seedRoot "TEMPLATES") -Destination (Join-Path $targetFullPath "TEMPLATES")

    # Delivery documentation (standards + operations + release + state)
    $docsSubdirs = @(
        "core",
        "planning",
        "standards",
        "process",
        "testing",
        "operations",
        "release",
        "security",
        "state"
    )
    foreach ($d in $docsSubdirs) {
        Copy-If-Exists -Source (Join-Path $seedRoot "docs\$d") -Destination (Join-Path $targetFullPath "docs\$d")
    }

    Copy-If-Exists -Source (Join-Path $seedRoot "docs\INDEX.md") -Destination (Join-Path $targetFullPath "docs\INDEX.md")

    # AI guidance + agent rules
    Copy-If-Exists -Source (Join-Path $seedRoot ".cursor") -Destination (Join-Path $targetFullPath ".cursor")

    # Config baselines (no secrets)
    Copy-If-Exists -Source (Join-Path $seedRoot ".editorconfig") -Destination (Join-Path $targetFullPath ".editorconfig")
    Copy-If-Exists -Source (Join-Path $seedRoot ".commitlintrc.yml") -Destination (Join-Path $targetFullPath ".commitlintrc.yml")
    Copy-If-Exists -Source (Join-Path $seedRoot ".pre-commit-config.yaml") -Destination (Join-Path $targetFullPath ".pre-commit-config.yaml")

    # Local dev contract
    $envTemplate = Join-Path $seedRoot "TEMPLATES\env-example-template"
    if (Test-Path -Path $envTemplate -PathType Leaf) {
        Copy-Item -Path $envTemplate -Destination (Join-Path $targetFullPath ".env.example") -Force
    }

    # Local dev / release helper scripts
    $scriptFiles = @(
        "validate-seed.ps1",
        "check-pre-release.ps1",
        "deploy.ps1",
        "smoke-test.ps1",
        "dev.ps1",
        "lint.ps1",
        "test.ps1"
    )

    $scriptsDest = Join-Path $targetFullPath "scripts"
    if (-not (Test-Path -Path $scriptsDest)) {
        New-Item -Path $scriptsDest -ItemType Directory | Out-Null
    }

    foreach ($sf in $scriptFiles) {
        $src = Join-Path $seedRoot "scripts\$sf"
        if (Test-Path -Path $src -PathType Leaf) {
            Copy-Item -Path $src -Destination (Join-Path $scriptsDest $sf) -Force
        }
    }
}

Write-Host ""
Write-Host "Project scaffold created successfully." -ForegroundColor Green
Write-Host "Type:   $ProjectType"
Write-Host "Target: $targetFullPath"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1) Answer docs/planning/DISCOVERY_QUESTIONS.md for this specific project"
Write-Host "2) Fill docs/planning/PROJECT_PROFILE.yaml"
Write-Host "3) Run scripts/validate-seed.ps1 (baseline health check)"
Write-Host "4) Start implementation using PLAYBOOKS/"
