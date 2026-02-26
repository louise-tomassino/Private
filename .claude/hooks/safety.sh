#!/bin/bash
# safety.sh — PreToolUse hook for Alfred OS security
#
# DETERMINISTIC enforcement layer. Cannot be bypassed by prompt injection.
#
# Email:
#   HARD BLOCK (exit 2):  send_email, reply_all_email, forward_email
#   FORCE ASK  (exit 0 + JSON): send_draft, trash_message
#
# Bash:
#   FORCE ASK: rm -rf, git push --force, git reset --hard, git clean -f

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(data.get('tool_name', ''))
" 2>/dev/null)

case "$TOOL_NAME" in
  # --- Email safety ---
  mcp__email-server__send_email|mcp__email-server__reply_all_email|mcp__email-server__forward_email)
    echo "BLOCKED: Direct email sending is permanently disabled. Use create_draft instead." >&2
    exit 2
    ;;
  mcp__email-server__send_draft)
    cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Sending a draft email requires your explicit approval."}}
EOF
    exit 0
    ;;
  mcp__email-server__trash_message)
    cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Trashing an email requires your explicit approval."}}
EOF
    exit 0
    ;;
  # --- Bash safety ---
  Bash)
    COMMAND=$(echo "$INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(data.get('input', {}).get('command', ''))
" 2>/dev/null)
    if echo "$COMMAND" | grep -qE 'rm\s+(-[a-zA-Z]*r[a-zA-Z]*f|--force|-[a-zA-Z]*f[a-zA-Z]*r)\s'; then
      cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"This command includes recursive forced deletion (rm -rf). Please confirm."}}
EOF
      exit 0
    fi
    if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force'; then
      cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Force-pushing can overwrite remote history. Please confirm."}}
EOF
      exit 0
    fi
    if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
      cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Hard reset discards uncommitted changes. Please confirm."}}
EOF
      exit 0
    fi
    if echo "$COMMAND" | grep -qE 'git\s+clean\s+.*-f'; then
      cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"git clean -f permanently deletes untracked files. Please confirm."}}
EOF
      exit 0
    fi
    exit 0
    ;;
  *)
    exit 0
    ;;
esac
