---
name: prd
description: "Generate PRD for Ralph Loop execution. Use when: plan feature, create prd, break down tasks, autonomous build."
---

# PRD Skill

Generate a Product Requirements Document formatted for Ralph Loop execution.

## When to Use

- "Plan out [feature]"
- "Create a PRD for [project]"
- "Break down [task] into steps"
- "Set up Ralph Loop for [feature]"

## Process

1. Ask 3-5 clarifying questions to understand the scope
2. Generate/update PRD.md with:
   - Clear project overview
   - Discrete, checkbox-based tasks
   - Acceptance criteria for each task
3. Ensure progress.md exists for tracking iterations

## Output Format

PRD.md MUST follow this structure for Ralph Loop compatibility:

```markdown
# [Project Name]

## Overview
[1-2 sentence description of what we're building]

## Tech Stack
[List relevant technologies]

## Tasks

### Task 1: [Task Name]
- [ ] [Specific acceptance criterion 1]
- [ ] [Specific acceptance criterion 2]
- [ ] [Specific acceptance criterion 3]

### Task 2: [Task Name]
- [ ] [Specific acceptance criterion 1]
- [ ] [Specific acceptance criterion 2]

[Continue for all tasks...]

## Success Criteria
[How do we know when the project is complete?]
```

## Guidelines

1. **Break down tasks small**: Each task should be completable in one Claude session
2. **Use checkboxes**: Every actionable item must have `- [ ]` format
3. **Be specific**: "Add a button" is bad. "Add a delete button that calls DELETE /api/tasks/:id" is good
4. **Order matters**: Tasks should be in dependency order (foundational first)
5. **Include technical details**: File names, API endpoints, component names when known

## Example Clarifying Questions

For a "user authentication" request:
1. What auth method? (email/password, OAuth, magic links?)
2. What provider/library? (NextAuth, Passport, custom?)
3. What user data to store? (just email, or profile info?)
4. Password reset flow needed?
5. Session duration preferences?

## After Creating PRD

Tell the user:
```
PRD.md updated!

To run autonomously:
  ./scripts/ralph.sh

To run with more iterations:
  ./scripts/ralph.sh 50
```

## Quality Markers

- Tasks are atomic (one thing per task)
- Each task has 2-5 acceptance criteria
- No ambiguous language ("improve", "better", "clean up")
- Technical decisions are explicit, not implied
