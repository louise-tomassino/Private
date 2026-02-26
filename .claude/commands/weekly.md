---
description: "Monday planning: review last week, set focus, create time blocks"
---

# Weekly Sync

Plan the week ahead. Run on Monday mornings.

## Phase 1: Gather Context (silent)

Do all of this before presenting anything:

### 1. Read Previous State

Read `system/memory/sync.md` to understand:
- Last week's focus areas
- Active decisions
- What was parked
- Any waiting-on items

### 2. Check What Got Done

**GitHub activity (last 7 days):**
```bash
# Closed issues from this repo (last 7 days)
gh issue list --state closed --search "closed:>=$(date -v-7d +%Y-%m-%d)"

# CUSTOMIZE: If you have separate category repos, add them:
# gh issue list --repo [your-username]/[work-repo] --state closed --search "closed:>=$(date -v-7d +%Y-%m-%d)"
# gh issue list --repo [your-username]/family --state closed --search "closed:>=$(date -v-7d +%Y-%m-%d)"
```

### 3. Pull This Week's Calendar

Query all calendars for the week ahead.

<!-- CUSTOMIZE: Add your calendar IDs here after setting up MCP -->

### 4. Pull Open Tasks

```bash
# Open tasks from this repo (include labels to see priorities and categories)
gh issue list --state open --json number,title,labels,createdAt

# CUSTOMIZE: If you have separate category repos, add them:
# gh issue list --repo [your-username]/[work-repo] --state open --json number,title,labels,createdAt
# gh issue list --repo [your-username]/family --state open --json number,title,labels,createdAt
```

### 5. Identify Priority Review Candidates

From the data gathered, build three lists:

**a) Current top-priority tasks** — tasks to validate:
- All today-labeled tasks across all repos
- All items listed in sync.md's "This Week's Focus"
- Any tasks that were flagged as "today" priorities in the last daily sync

**b) Upgrade candidates** — tasks that may deserve higher priority:
- Tasks with due dates in the next 14 days that are later or unlabeled
- Unlabeled/later tasks that relate to this week's calendar events (e.g., a task about "client X" when there's a meeting with client X this week)
- Unlabeled/later tasks that relate to the focus areas in sync.md
- Tasks open for 3+ weeks with no activity — these need a promote-or-park decision

**c) Downgrade candidates** — tasks that may no longer belong at the top:
- today tasks that have been today for 2+ weeks without progress
- Last week's focus items that didn't get touched
- Tasks whose related project or deadline has passed

---

## Phase 2: Priority Health Check

Present this FIRST, before the weekly summary. This is a conversation — get decisions before moving on.

```markdown
## Priority Health Check

### Still top priority?

Review each item. For each one, decide: **keep, demote, or park.**

| # | Task | Current | Since | Flag |
|---|------|---------|-------|------|
| repo#12 | Task title | today | 2 weeks | No progress last week |
| repo#15 | Task title | Focus item | last week | Still open |

### Consider promoting

| # | Task | Current | Why |
|---|------|---------|-----|
| repo#22 | Task title | later | Due date Feb 8 (this week) |
| repo#31 | Task title | none | Relates to "Launch marketing" (your big rock) |
| repo#8 | Task title | later | Open 3 weeks, no activity — promote or park? |

### Consider parking

| # | Task | Current | Why |
|---|------|---------|-----|
| repo#14 | Task title | this-week | Not related to any current focus area |
| repo#19 | Task title | today | Blocked 2 weeks, no path forward |
```

**Wait for input.** Apply label changes and park decisions before continuing to Phase 3.

To update labels:
```bash
# Promote a task
gh issue edit [number] --add-label "today" --remove-label "later"

# Park a task (add comment explaining why, then close)
gh issue comment [number] --body "Parked: [reason]. Will revisit [when]."
gh issue close [number]

# For tasks in separate repos, add --repo [your-username]/[repo]
```

---

## Phase 3: Weekly Summary

Now present the weekly overview (incorporating any changes from Phase 2):

```markdown
## Weekly Sync - [Date]

### Last Week
- Shipped: [closed issues]
- Still open: [rolled over from last week's focus]
- Parked: [items parked during health check]
- Promoted: [items promoted during health check]

### This Week's Calendar
- Mon: [events]
- Tue: [events]
- Wed: [events]
- Thu: [events]
- Fri: [events]

### Open Tasks (after health check)
Work: [count] | Private: [count] | Family: [count]
Notable deadlines: [any with due dates in next 14 days]

### Suggested Big Rocks (3 max)
1. [Most important]
2. [Second]
3. [Third]

### Questions
1. [Any meetings needing prep time blocked?]
2. [Big rocks correct? Want focus blocks created?]
```

---

## Phase 4: Discussion & Actions

Based on answers:

### Create Calendar Blocks (if requested)

Create focus time blocks for big rocks.

### Create Tasks

If action items need tracking:
```bash
gh issue create --title "[action item]" --label "work"
# For separate repos: gh issue create --repo [your-username]/[work-repo] --title "[action item]"
```

### Update system/memory/sync.md

Overwrite with new state:

```markdown
# Sync State

*Last sync: [date] (weekly)*

## This Week's Focus

1. [Big rock 1]
2. [Big rock 2]
3. [Big rock 3]

## Active Decisions

- [Any decisions made during this sync]
- [Priority changes from health check]

## Waiting On

- [Things blocked on others]

## Parked

- [Consciously deprioritized items]
- [Items parked during health check with reasons]

## Notes

- [Created X focus blocks]
- [Promoted X tasks, parked Y tasks during health check]
- [Other relevant context]
```

---

## Output Format Notes

- Calendar: bullet points, not tables
- Keep it scannable
- Don't repeat info that's obvious from context
