#!/bin/bash
# Loads memory context at session start and after compaction.
# Output goes to stdout and is injected into the conversation.

MEMORY_DIR="$CLAUDE_PROJECT_DIR/memory"
TODAY=$(date +%Y-%m-%d)
YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)

# Long-term memory
if [ -f "$MEMORY_DIR/MEMORY.md" ]; then
  CONTENT=$(cat "$MEMORY_DIR/MEMORY.md")
  # Only output if file has content beyond comments
  if echo "$CONTENT" | grep -qv '^\s*$\|^\s*<!--'; then
    echo "=== LONG-TERM MEMORY ==="
    echo "$CONTENT"
    echo ""
  fi
fi

# Yesterday's daily log
if [ -f "$MEMORY_DIR/daily/$YESTERDAY.md" ]; then
  echo "=== YESTERDAY ($YESTERDAY) ==="
  cat "$MEMORY_DIR/daily/$YESTERDAY.md"
  echo ""
fi

# Today's daily log
if [ -f "$MEMORY_DIR/daily/$TODAY.md" ]; then
  echo "=== TODAY ($TODAY) ==="
  cat "$MEMORY_DIR/daily/$TODAY.md"
  echo ""
fi

exit 0
