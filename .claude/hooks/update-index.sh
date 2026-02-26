#!/bin/bash
# update-index.sh — PostToolUse hook that regenerates INDEX.md
#
# Keeps an auto-updated index of all your documents so Claude always
# knows what you have without scanning every directory.
#
# Triggers after Write, Edit, or NotebookEdit operations.
# Only indexes the four PARA folders (1-key-areas, 2-projects, 3-resources, 4-archive).

set -euo pipefail

# Use CLAUDE_PROJECT_DIR if available, otherwise find repo root
REPO_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null)}" || exit 0
INDEX_FILE="$REPO_ROOT/INDEX.md"

# Simple debounce: skip if INDEX.md was modified less than 1 second ago
if [[ -f "$INDEX_FILE" ]]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    last_mod=$(stat -f %m "$INDEX_FILE" 2>/dev/null || echo 0)
  else
    last_mod=$(stat -c %Y "$INDEX_FILE" 2>/dev/null || echo 0)
  fi
  now=$(date +%s)
  if (( now - last_mod < 1 )); then
    exit 0
  fi
fi

# Only index the four PARA folders
PARA_FOLDERS=("1-key-areas" "2-projects" "3-resources" "4-archive")

# Generate the index
{
  echo "# Index"
  echo ""
  echo "*Auto-generated — do not edit manually.*"
  echo "*Last updated: $(date '+%Y-%m-%d %H:%M')*"
  echo ""

  cd "$REPO_ROOT"

  for folder in "${PARA_FOLDERS[@]}"; do
    # Skip if folder doesn't exist
    [[ -d "$folder" ]] || continue

    # Find .md files in this folder
    files=$(find "$folder" -name '*.md' 2>/dev/null | sort)
    [[ -z "$files" ]] && continue

    echo "## $folder/"
    echo ""

    echo "$files" | while read -r filepath; do
      # Extract first heading (# Title) from the file
      title=$(grep -m 1 '^#' "$filepath" 2>/dev/null | sed -E 's/^#+ //' || true)

      # Path relative to the PARA folder
      rel_path="${filepath#$folder/}"

      if [[ -n "$title" ]]; then
        echo "- **$rel_path** — $title"
      else
        echo "- **$rel_path**"
      fi
    done

    echo ""
  done
} > "$INDEX_FILE"

exit 0
