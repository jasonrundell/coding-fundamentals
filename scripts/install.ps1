param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$CursorRoot = Join-Path $HOME ".cursor"
$RulesTarget = Join-Path $CursorRoot "rules"
$SkillsTarget = Join-Path $CursorRoot "skills"

function Copy-SafeFile {
    param(
        [string]$Source,
        [string]$Destination
    )

    if ((Test-Path $Destination) -and -not $Force) {
        Write-Host "Skip existing file: $Destination"
        return
    }

    Copy-Item $Source $Destination -Force:$Force
    Write-Host "Copied file: $Destination"
}

function Copy-SafeDirectory {
    param(
        [string]$Source,
        [string]$Destination
    )

    if ((Test-Path $Destination) -and -not $Force) {
        Write-Host "Skip existing directory: $Destination"
        return
    }

    if ((Test-Path $Destination) -and $Force) {
        Remove-Item $Destination -Recurse -Force
    }

    Copy-Item $Source $Destination -Recurse
    Write-Host "Copied directory: $Destination"
}

New-Item -ItemType Directory -Force $RulesTarget | Out-Null
New-Item -ItemType Directory -Force $SkillsTarget | Out-Null

Copy-SafeFile `
    -Source (Join-Path $RepoRoot "rules/global-fundamentals.mdc") `
    -Destination (Join-Path $RulesTarget "global-fundamentals.mdc")

Copy-SafeDirectory `
    -Source (Join-Path $RepoRoot "skills/coding-fundamentals") `
    -Destination (Join-Path $SkillsTarget "coding-fundamentals")

Copy-SafeDirectory `
    -Source (Join-Path $RepoRoot "skills/grill-me") `
    -Destination (Join-Path $SkillsTarget "grill-me")

Write-Host ""
Write-Host "Install complete."
Write-Host "Optional project rule templates remain in: $(Join-Path $RepoRoot 'rules')"
