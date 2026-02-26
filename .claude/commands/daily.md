---
description: "Morning sync: today's priorities, calendar check, quick adjustments"
---

# Daily Sync

Quick morning check-in. Lighter than /weekly.

## Phase 1: Gather Context (silent)

### 1. Read Current State

Read `system/memory/sync.md` for:
- This week's focus areas
- Active decisions
- Waiting-on items

### 2. Pull Today's Calendar

Query calendars for today only.

<!-- CUSTOMIZE: Add your calendar IDs here after setting up MCP
Example:
- Work: `your-work@email.com` (account: work)
- Personal: `your-personal@email.com` (account: normal)
-->

### 3. Quick Task Check

```bash
# Tasks from this repo (your personal home base)
gh issue list --state open --limit 10

# Filter by category label if needed
# gh issue list --state open --label "work" --limit 10
# gh issue list --state open --label "personal" --limit 5
# gh issue list --state open --label "family" --limit 5

# CUSTOMIZE: If you have separate category repos, add them:
# gh issue list --repo [your-username]/[work-repo] --state open --limit 10
# gh issue list --repo [your-username]/family --state open --limit 5
```

Focus on:
- Tasks with today's deadline
- Tasks related to this week's big rocks

---

## Phase 2: Present Summary

Single concise output:

```markdown
## Daily Sync - [Date]

### Today's Calendar
- [time]: [event]
- [time]: [event]
- (or "Clear day" if nothing)

### This Week's Focus (from sync-state)
1. [Big rock 1] - [status/next action]
2. [Big rock 2] - [status/next action]
3. [Big rock 3] - [status/next action]

### Today's Top 3
1. [Most important thing to do today]
2. [Second]
3. [Third]

### Meetings Today
- [time]: [meeting] with [attendees]
- (flag first-time or external meetings: "First meeting — want me to prep?")
- (or "No meetings today")

### Heads Up
- [Upcoming deadlines]
- [Waiting-on items that might unblock today]
```

---

## Phase 3: Quick Adjustments

If changes are mentioned:

### Update system/memory/sync.md (if needed)

Only update if something material changed:
- New blocker discovered
- Decision made
- Priority shift

---

## Keep It Short

Daily sync should be:
- 30 seconds to read
- Today-focused
- Actionable

Don't rehash the full week - that's what /weekly is for.
