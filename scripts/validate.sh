#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
failed=false

fail() {
  echo "FAIL: $1"
  failed=true
}

pass() {
  echo "PASS: $1"
}

require_file() {
  local path="$1"

  if [[ -f "$repo_root/$path" ]]; then
    pass "$path exists"
  else
    fail "$path is missing"
  fi
}

file_contains() {
  local path="$1"
  local text="$2"
  local label="$3"

  if [[ -f "$repo_root/$path" && "$( < "$repo_root/$path" )" == *"$text"* ]]; then
    pass "$label"
  else
    fail "$label"
  fi
}

check_rule() {
  local path="$1"
  local content
  local first_line

  content="$( < "$path" )"
  IFS= read -r first_line < "$path"
  first_line="${first_line%$'\r'}"

  if [[ "$first_line" == "---" ]]; then
    pass "${path#$repo_root/} starts with frontmatter"
  else
    fail "${path#$repo_root/} starts with frontmatter"
  fi

  if [[ "$content" == *"description:"* ]]; then
    pass "${path#$repo_root/} has description"
  else
    fail "${path#$repo_root/} has description"
  fi

  if [[ "$content" == *"alwaysApply:"* ]]; then
    pass "${path#$repo_root/} has alwaysApply"
  else
    fail "${path#$repo_root/} has alwaysApply"
  fi
}

required_files=(
  "README.md"
  "SOUL.md"
  "PROJECT_INDEX.md"
  "docs/concepts.md"
  "docs/deduplication.md"
  "docs/install.md"
  "docs/onboarding.md"
  "docs/self-assessment.md"
  "docs/workflow-improvement-loop.md"
  "docs/learning-log.md"
  "scripts/install.ps1"
  "scripts/install.sh"
  "scripts/validate.ps1"
  "scripts/validate.sh"
  "rules/global-fundamentals.mdc"
  "skills/coding-fundamentals/SKILL.md"
  "skills/grill-me/SKILL.md"
)

for file in "${required_files[@]}"; do
  require_file "$file"
done

while IFS= read -r -d '' rule_file; do
  check_rule "$rule_file"
done < <(find "$repo_root/rules" "$repo_root/.cursor/rules" -name "*.mdc" -print0)

file_contains "docs/install.md" "## Windows" "install docs include Windows"
file_contains "docs/install.md" "## macOS" "install docs include macOS"
file_contains "docs/install.md" "## Linux" "install docs include Linux"

for path in "${required_files[@]}"; do
  file_contains "PROJECT_INDEX.md" "\`$path\`" "project index mentions $path"
done

file_contains "README.md" "docs/self-assessment.md" "README mentions self-assessment"
file_contains "README.md" "scripts/validate.ps1" "README mentions validation scripts"
file_contains "README.md" "scripts/validate.sh" "README mentions validation scripts"

if [[ "$failed" == "true" ]]; then
  echo ""
  echo "Validation failed."
  exit 1
fi

echo ""
echo "Validation passed."
