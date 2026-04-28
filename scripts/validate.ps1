$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Failed = $false

function Fail {
    param([string]$Message)

    Write-Host "FAIL: $Message"
    $script:Failed = $true
}

function Pass {
    param([string]$Message)

    Write-Host "PASS: $Message"
}

function Require-File {
    param([string]$Path)

    $FullPath = Join-Path $RepoRoot $Path

    if (Test-Path $FullPath -PathType Leaf) {
        Pass "$Path exists"
    }
    else {
        Fail "$Path is missing"
    }
}

function File-Contains {
    param(
        [string]$Path,
        [string]$Text,
        [string]$Label
    )

    $FullPath = Join-Path $RepoRoot $Path

    if ((Test-Path $FullPath -PathType Leaf) -and ((Get-Content $FullPath -Raw).Contains($Text))) {
        Pass $Label
    }
    else {
        Fail $Label
    }
}

function Check-Rule {
    param([string]$Path)

    $Content = Get-Content $Path -Raw
    $RelativePath = Resolve-Path -Path $Path -Relative

    if ($Content.StartsWith("---`n") -or $Content.StartsWith("---`r`n")) {
        Pass "$RelativePath starts with frontmatter"
    }
    else {
        Fail "$RelativePath starts with frontmatter"
    }

    if ($Content.Contains("description:")) {
        Pass "$RelativePath has description"
    }
    else {
        Fail "$RelativePath has description"
    }

    if ($Content.Contains("alwaysApply:")) {
        Pass "$RelativePath has alwaysApply"
    }
    else {
        Fail "$RelativePath has alwaysApply"
    }
}

$RequiredFiles = @(
    "README.md",
    "PROJECT_INDEX.md",
    "docs/concepts.md",
    "docs/deduplication.md",
    "docs/install.md",
    "docs/onboarding.md",
    "docs/self-assessment.md",
    "docs/workflow-improvement-loop.md",
    "docs/learning-log.md",
    "scripts/install.ps1",
    "scripts/install.sh",
    "scripts/validate.ps1",
    "scripts/validate.sh",
    "rules/global-fundamentals.mdc",
    "skills/coding-fundamentals/SKILL.md"
)

foreach ($File in $RequiredFiles) {
    Require-File $File
}

$RuleRoots = @(
    (Join-Path $RepoRoot "rules"),
    (Join-Path $RepoRoot ".cursor/rules")
)

foreach ($RuleRoot in $RuleRoots) {
    if (Test-Path $RuleRoot) {
        Get-ChildItem $RuleRoot -Filter "*.mdc" -File | ForEach-Object {
            Check-Rule $_.FullName
        }
    }
}

File-Contains "docs/install.md" "## Windows" "install docs include Windows"
File-Contains "docs/install.md" "## macOS" "install docs include macOS"
File-Contains "docs/install.md" "## Linux" "install docs include Linux"

foreach ($Path in $RequiredFiles) {
    File-Contains "PROJECT_INDEX.md" "``$Path``" "project index mentions $Path"
}

File-Contains "README.md" "docs/self-assessment.md" "README mentions self-assessment"
File-Contains "README.md" "scripts/validate.ps1" "README mentions validation scripts"
File-Contains "README.md" "scripts/validate.sh" "README mentions validation scripts"

if ($Failed) {
    Write-Host ""
    Write-Host "Validation failed."
    exit 1
}

Write-Host ""
Write-Host "Validation passed."
