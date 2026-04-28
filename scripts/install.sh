#!/usr/bin/env bash
set -euo pipefail

force=false

if [[ "${1:-}" == "--force" ]]; then
  force=true
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
cursor_root="$HOME/.cursor"
rules_target="$cursor_root/rules"
skills_target="$cursor_root/skills"

copy_safe_file() {
  local source="$1"
  local destination="$2"

  if [[ -e "$destination" && "$force" != "true" ]]; then
    echo "Skip existing file: $destination"
    return
  fi

  cp -f "$source" "$destination"
  echo "Copied file: $destination"
}

copy_safe_directory() {
  local source="$1"
  local destination="$2"

  if [[ -e "$destination" && "$force" != "true" ]]; then
    echo "Skip existing directory: $destination"
    return
  fi

  if [[ -e "$destination" && "$force" == "true" ]]; then
    rm -rf "$destination"
  fi

  cp -R "$source" "$destination"
  echo "Copied directory: $destination"
}

mkdir -p "$rules_target" "$skills_target"

copy_safe_file \
  "$repo_root/rules/global-fundamentals.mdc" \
  "$rules_target/global-fundamentals.mdc"

copy_safe_directory \
  "$repo_root/skills/coding-fundamentals" \
  "$skills_target/coding-fundamentals"

echo ""
echo "Install complete."
echo "Optional project rule templates remain in: $repo_root/rules"
