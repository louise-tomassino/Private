#!/bin/bash

# Ralph Loop - Autonomous Claude Code execution with fresh context windows
# Based on Geoffrey Huntley's original Ralph technique
#
# Key difference from the official plugin:
# - Each iteration spawns a NEW Claude Code session (fresh context window)
# - progress.md carries learnings between sessions
# - Stays in the "smart zone" (<100k tokens) instead of filling context until auto-compact
#
# Usage:
#   ./scripts/ralph.sh [max_iterations]
#
# Examples:
#   ./scripts/ralph.sh        # Default: 10 iterations
#   ./scripts/ralph.sh 50     # Run up to 50 iterations

set -e

# Configuration
MAX_ITERATIONS=${1:-10}
PRD_FILE="PRD.md"
PROGRESS_FILE="progress.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Ralph Loop - Autonomous Claude Code${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  Max iterations: ${YELLOW}${MAX_ITERATIONS}${NC}"
echo -e "  PRD file:       ${PRD_FILE}"
echo -e "  Progress file:  ${PROGRESS_FILE}"
echo ""

# Check for required files
if [ ! -f "$PRD_FILE" ]; then
    echo -e "${RED}Error: PRD.md not found${NC}"
    echo "Create a PRD.md file with tasks before running Ralph."
    echo "Use 'claude /prd' or create manually with checkbox tasks."
    exit 1
fi

# Create progress.md if it doesn't exist
if [ ! -f "$PROGRESS_FILE" ]; then
    echo "# Progress Log" > "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo "This file tracks what each Ralph iteration attempted and learned." >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo -e "${YELLOW}Created ${PROGRESS_FILE}${NC}"
fi

# The prompt that gets fed to each new Claude Code session
RALPH_PROMPT=$(cat << 'PROMPT_EOF'
You are running in a Ralph Loop - an autonomous iteration system for completing tasks.

## Your Mission
1. Read PRD.md to find the first task with an unchecked box `- [ ]`
2. Read progress.md to see what previous iterations attempted (learn from failures)
3. Work on completing that task
4. Update progress.md with what you tried and the results
5. If successful, check off the task in PRD.md with `- [x]`
6. Exit cleanly (don't ask questions - make decisions and document them)

## Important Rules
- DO NOT ask for user input - make reasonable decisions and document them in progress.md
- If you complete a task, mark it `- [x]` in PRD.md
- If you can't complete a task, document what you tried in progress.md so the next iteration can try something different
- Focus on ONE task per session - complete it or document the blockers
- Be thorough but efficient - you have fresh context, use it wisely

## Progress Log Format
When updating progress.md, append an entry like:

```
## Iteration [N] - [timestamp]
**Task**: [task name from PRD]
**Status**: [completed/blocked/in-progress]
**Actions taken**:
- Did X
- Tried Y
**Results**:
- X worked
- Y failed because Z
**Next steps** (if blocked):
- Suggest trying A instead of Y
```

Now read PRD.md and progress.md, then start working on the first incomplete task.
PROMPT_EOF
)

# Count incomplete tasks
count_incomplete_tasks() {
    grep -c '^\- \[ \]' "$PRD_FILE" 2>/dev/null || echo "0"
}

# Main loop
echo -e "${GREEN}Starting Ralph Loop...${NC}"
echo ""

iteration=1
while [ $iteration -le $MAX_ITERATIONS ]; do
    incomplete=$(count_incomplete_tasks)

    if [ "$incomplete" -eq 0 ]; then
        echo ""
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${GREEN}  All tasks complete!${NC}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        exit 0
    fi

    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  Iteration ${iteration}/${MAX_ITERATIONS}${NC}"
    echo -e "${BLUE}  Incomplete tasks: ${incomplete}${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    # Add iteration marker to progress.md
    echo "" >> "$PROGRESS_FILE"
    echo "---" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"

    # Run Claude Code with fresh session (--print exits after completion)
    # The -p flag sends a prompt, --dangerously-skip-permissions for autonomous mode
    claude -p "$RALPH_PROMPT" --dangerously-skip-permissions --verbose

    exit_code=$?

    echo ""
    echo -e "${YELLOW}Iteration ${iteration} complete (exit code: ${exit_code})${NC}"

    # Check remaining tasks after this iteration
    remaining=$(count_incomplete_tasks)
    echo -e "Remaining incomplete tasks: ${remaining}"

    iteration=$((iteration + 1))

    # Small delay between iterations
    sleep 2
done

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}  Max iterations reached (${MAX_ITERATIONS})${NC}"
remaining=$(count_incomplete_tasks)
echo -e "${YELLOW}  Incomplete tasks remaining: ${remaining}${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "To continue, run: ./scripts/ralph.sh [more_iterations]"
