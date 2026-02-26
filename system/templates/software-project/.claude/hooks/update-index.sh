#!/bin/bash
# update-index.sh — PostToolUse hook that regenerates INDEX.md
#
# Keeps an auto-updated index of your docs so Claude always
# knows what you have without scanning every directory.
#
# Triggers after Write, Edit, or NotebookEdit operations.

set -euo pipefail

# Use CLAUDE_PROJECT_DIR if available, otherwise find repo root
REPO_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null)}" || exit 0
INDEX_FILE="$REPO_ROOT/INDEX.md"
DOCS_DIR="$REPO_ROOT/docs"

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

# Only index the docs folder
[[ -d "$DOCS_DIR" ]] || exit 0

# Generate the index
{
  echo "# Index"
  echo ""
  echo "*Auto-generated — do not edit manually.*"
  echo "*Last updated: $(date '+%Y-%m-%d %H:%M')*"
  echo ""

  cd "$REPO_ROOT"

  # Find .md files in docs/
  files=$(find docs -name '*.md' 2>/dev/null | sort)
  if [[ -n "$files" ]]; then
    echo "## docs/"
    echo ""

    echo "$files" | while read -r filepath; do
      # Extract first heading (# Title) from the file
      title=$(grep -m 1 '^#' "$filepath" 2>/dev/null | sed -E 's/^#+ //' || true)

      # Path relative to docs/
      rel_path="${filepath#docs/}"

      if [[ -n "$title" ]]; then
        echo "- **$rel_path** — $title"
      else
        echo "- **$rel_path**"
      fi
    done

    echo ""
  fi
} > "$INDEX_FILE"

exit 0
