#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="prompt-generator"
SOURCE_DIR="$REPO_ROOT/$SKILL_NAME"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_DIR="$CODEX_HOME_DIR/skills/$SKILL_NAME"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Skill source not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$CODEX_HOME_DIR/skills"
rm -rf "$TARGET_DIR"
cp -R "$SOURCE_DIR" "$TARGET_DIR"

echo "Installed $SKILL_NAME to $TARGET_DIR"
echo "Restart Codex to pick up the updated skill."
