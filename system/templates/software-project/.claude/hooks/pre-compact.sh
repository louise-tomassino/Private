#!/bin/bash
# Pre-compact hook: Extract session context from the transcript before compaction.
#
# The PreCompact echo approach doesn't work — Claude never gets a turn to act
# before compaction proceeds. This script reads the JSONL transcript directly
# and writes a daily log entry from the shell.
#
# Stdin: JSON with transcript_path, session_id, trigger, etc.
# Output: stdout text is injected into the compaction summary.

set -euo pipefail

# Read stdin JSON and export for python3
export INPUT=$(cat)

# Determine memory directory (system/memory/ for Alfred OS, memory/ for project templates)
if [ -d "$CLAUDE_PROJECT_DIR/system/memory" ]; then
  MEMORY_DIR="$CLAUDE_PROJECT_DIR/system/memory"
elif [ -d "$CLAUDE_PROJECT_DIR/memory" ]; then
  MEMORY_DIR="$CLAUDE_PROJECT_DIR/memory"
else
  exit 0
fi

TODAY=$(date +%Y-%m-%d)
DAILY_DIR="$MEMORY_DIR/daily"
DAILY_FILE="$DAILY_DIR/$TODAY.md"

mkdir -p "$DAILY_DIR"

# Use python3 to parse the transcript and append to the daily log.
# python3 ships with macOS — no extra dependencies needed.
python3 - "$DAILY_FILE" <<'PYEOF'
import json
import sys
import os
from datetime import datetime

daily_file = sys.argv[1]
project_dir = os.environ.get("CLAUDE_PROJECT_DIR", "")

# Parse stdin JSON to get transcript path
try:
    hook_input = json.loads(os.environ.get("INPUT", "{}"))
except (json.JSONDecodeError, TypeError):
    hook_input = {}

transcript_path = hook_input.get("transcript_path", "")

# Fallback: find most recent .jsonl in the Claude projects directory
if not transcript_path or not os.path.isfile(transcript_path):
    session_id = hook_input.get("session_id", "")
    if session_id:
        # Try common Claude project paths
        home = os.path.expanduser("~")
        safe_cwd = project_dir.replace("/", "-").lstrip("-")
        projects_dir = os.path.join(home, ".claude", "projects", safe_cwd)
        candidate = os.path.join(projects_dir, f"{session_id}.jsonl")
        if os.path.isfile(candidate):
            transcript_path = candidate

if not transcript_path or not os.path.isfile(transcript_path):
    sys.exit(0)

# Read the tail of the transcript for performance (last ~500 lines).
# Transcripts can be very large; we only need recent context.
try:
    with open(transcript_path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()
except (IOError, OSError):
    sys.exit(0)

# Take the last 500 lines (or all if fewer)
tail = lines[-500:] if len(lines) > 500 else lines

user_messages = []
files_changed = set()

for line in tail:
    line = line.strip()
    if not line:
        continue
    try:
        entry = json.loads(line)
    except json.JSONDecodeError:
        continue

    msg_type = entry.get("type", "")
    message = entry.get("message", {})
    content = message.get("content", "")

    # Extract user messages
    if msg_type == "user" and isinstance(content, str) and content.strip():
        text = content.strip()
        # Skip warmup/system messages
        if text.lower() in ("warmup", ""):
            continue
        # Truncate long messages
        if len(text) > 200:
            text = text[:200] + "..."
        user_messages.append(text)

    # Extract file changes from assistant tool_use blocks
    if msg_type == "assistant" and isinstance(content, list):
        for block in content:
            if not isinstance(block, dict):
                continue
            if block.get("type") != "tool_use":
                continue
            tool_name = block.get("name", "")
            tool_input = block.get("input", {})
            if not isinstance(tool_input, dict):
                continue

            if tool_name in ("Write", "Edit", "NotebookEdit"):
                fp = tool_input.get("file_path", "")
                if fp and project_dir and fp.startswith(project_dir):
                    fp = fp[len(project_dir):].lstrip("/")
                if fp:
                    files_changed.add(fp)
            elif tool_name == "Bash":
                # Try to catch common file-creating commands
                cmd = tool_input.get("command", "")
                if ">" in cmd or "mkdir" in cmd or "cp " in cmd or "mv " in cmd:
                    files_changed.add(f"(via bash: {cmd[:80]})")

# Deduplicate user messages while preserving order
seen = set()
unique_messages = []
for msg in user_messages:
    key = msg[:100].lower()
    if key not in seen:
        seen.add(key)
        unique_messages.append(msg)

# Only write if there's something to record
if not unique_messages and not files_changed:
    sys.exit(0)

# Build the daily log entry
now = datetime.now().strftime("%H:%M")
entry_lines = []
entry_lines.append(f"## Session — {now}\n")

if unique_messages:
    entry_lines.append("**What was worked on:**")
    for msg in unique_messages[-15:]:  # Last 15 unique messages
        entry_lines.append(f"- {msg}")
    entry_lines.append("")

if files_changed:
    entry_lines.append("**Files changed:**")
    for fp in sorted(files_changed):
        entry_lines.append(f"- {fp}")
    entry_lines.append("")

entry_text = "\n".join(entry_lines) + "\n"

# Append to daily log
try:
    with open(daily_file, "a", encoding="utf-8") as f:
        f.write(entry_text)
except (IOError, OSError):
    sys.exit(0)
PYEOF

exit 0
