# Example Skills

Examples of skills for your command center.

---

## Example 1: Processing Inbox

A workflow skill for email triage.

```markdown
---
name: processing-inbox
description: "Process flagged emails into responses and digests. Use when: process inbox, email triage, check email."
---

# Processing Inbox

## Core Principle

Flagged emails are either "respond" or "read later" - categorize fast, then batch process.

## When to Use

- "Process my inbox"
- "Check my email"
- "Email triage"

## Process

1. **Pull starred emails** from Gmail (`is:starred`)
2. **Categorize each**:
   - Real person expecting reply -> Response queue
   - Newsletter/article/FYI -> Reading queue
   - Mixed -> Both queues + create task
3. **Show split** for confirmation
4. **Reading queue**: Summarize into `3-resources/digests/YYYY-MM-DD.md`
5. **Response queue**:
   - Simple: draft inline, get approval, send
   - Complex: create in `drafts/`, iterate, send, delete

## Quality Markers

- Every email categorized with clear reasoning
- Digests are scannable bullet points, not prose
- Draft emails match your voice

## Anti-Patterns

- Processing without showing the split first
- Writing verbose digest summaries
- Forgetting to delete draft files after sending
```

---

## Example 2: Morning Standup

A simple daily overview skill.

```markdown
---
name: morning-standup
description: "Daily overview of tasks and calendar. Use when: what's on today, morning standup, daily tasks."
---

# Morning Standup

## Core Principle

Quick snapshot of the day - tasks by category, calendar events, nothing more.

## When to Use

- "What's on today?"
- "Morning standup"
- "What are my tasks?"

## Process

1. Query open issues from this repo (and any separate category repos)
2. Check calendar for today's events
3. Present organized by category (using labels or repos):
   - Work
   - Personal
   - Family
4. Note any conflicts or tight scheduling

## Output Format

```
## Work
- [ ] #26 Fix API timeout [work]

## Personal
- [ ] #3 Renew passport [due:2025-02-01]

## Family
- [ ] #12 Book dentist for kids [family]

## Calendar
- 10:00 Team standup
- 14:00 Important call
```

## Anti-Patterns

- Including completed tasks
- Over-explaining task context
- Listing all calendar events (just today)
```

---

## Example 3: Slash Command (Simple Action)

For comparison - a slash command, not a skill.

**File**: `.claude/commands/family-tasks.md`

```markdown
List all open tasks from the family category.

```bash
gh issue list --repo [your-username]/family --state open
```

Format as checkbox list with issue numbers.
```

Invoked with `/family-tasks` - no workflow, just action.
