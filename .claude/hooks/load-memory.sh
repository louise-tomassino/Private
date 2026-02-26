#!/bin/bash
# Loads memory context at session start and after compaction.
# Output goes to stdout and is injected into the conversation.

MEMORY_DIR="$CLAUDE_PROJECT_DIR/system/memory"
TODAY=$(date +%Y-%m-%d)
YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)

# --- Template repository guard ---
# Warn if working in the template repo instead of a personal copy.
# This check runs every session to catch accidental use.
REMOTE_URL=$(git -C "$CLAUDE_PROJECT_DIR" remote get-url origin 2>/dev/null || echo "")
if [[ "$REMOTE_URL" == *"alfred-os-template"* ]]; then
  echo "=== WARNING: TEMPLATE REPOSITORY ==="
  echo "This appears to be the Alfred OS template repository, not a personal copy."
  echo "Working here will modify the template that gets shared with all customers."
  echo ""
  echo "If this is intentional (you're developing the template), proceed carefully."
  echo "If not, the user should open their personal Alfred folder instead."
  echo ""
  echo "Ask the user to confirm before doing any work."
  echo ""
fi

# --- First-run detection ---
# If .initialized doesn't exist and CLAUDE.md still has placeholders,
# this is a fresh installation that needs setup.
if [ ! -f "$MEMORY_DIR/.initialized" ]; then
  if grep -q '\[YOUR NAME\]\|\[YOUR LOCATION\]\|\[YOUR JOB/ROLE\]' "$CLAUDE_PROJECT_DIR/CLAUDE.md" 2>/dev/null; then
    echo "=== FIRST RUN ==="
    echo "This is a fresh Alfred OS installation. The user has NOT been onboarded yet."
    echo ""
    echo "DO NOT give a generic greeting. Instead, do the following:"
    echo ""
    echo "1. WELCOME: Greet them warmly. Introduce yourself as Alfred — their new personal AI assistant."
    echo "   Keep it brief and exciting, not overwhelming. Something like:"
    echo "   'Welcome to Alfred! I'm your personal AI assistant. I live right here on your computer"
    echo "   and I'm about to get to know you so I can actually be useful. Let's get you set up.'"
    echo ""
    echo "2. REPO CHECK: Check if a GitHub remote is configured:"
    echo "   - Run: git remote get-url origin"
    echo "   - If no remote exists, help create a private GitHub repo and set it as origin"
    echo "   - If a remote exists but points to 'alfred-os-template', help change it to their own repo"
    echo "   - Push the initial commit once the remote is correct"
    echo ""
    echo "3. BEGIN ONBOARDING: After the repo is set up, read the onboarding skill"
    echo "   (.claude/skills/onboarding/SKILL.md) and begin Phase 1: Discovery."
    echo "   Start the interview naturally — don't announce 'now beginning Phase 1'."
    echo ""
    echo "4. MARKER: After the GitHub remote is confirmed working and the first push succeeds,"
    echo "   create the file: system/memory/.initialized (contents: date of initialization)."
    echo "   This prevents the first-run message from appearing again."
    echo ""
    echo "The user may have said anything to start this conversation — 'hi', a question,"
    echo "or even something unrelated. Regardless, prioritize the setup flow above."
    echo "If they asked something specific, acknowledge it and let them know you'll get to it"
    echo "after a quick setup."
    echo "=== END FIRST RUN ==="
    echo ""
  else
    # CLAUDE.md is customized but marker is missing — not a true first run.
    # Silently create the marker.
    touch "$MEMORY_DIR/.initialized"
  fi
fi

# --- Regular memory loading ---

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
