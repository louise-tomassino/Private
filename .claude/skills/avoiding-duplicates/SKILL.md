---
name: avoiding-duplicates
description: "Prevent duplicate drafts and tasks. Use when: creating drafts, creating tasks, inbox processing, task management."
---

# Avoiding Duplicates

## Core Principle

Never create duplicate drafts or tasks. Always check first, then create or suggest improvements.

## When to Use

This skill applies automatically whenever:
- Creating email drafts
- Creating GitHub issues/tasks
- Processing meeting transcripts
- Any workflow that creates drafts or tasks

## Process

### Before Creating a Draft

1. **Check existing drafts** for the same thread/recipient:
   ```
   list_drafts(query: "to:recipient@email.com")
   ```

2. **If draft exists for that email thread:**
   - Do NOT create a new draft
   - Read the existing draft
   - Suggest improvements if the user's intent differs
   - State: "There's already a draft for this email. Would you like me to update it?"

3. **If no draft exists:**
   - Proceed with creating the draft

### Before Creating a Task

1. **Check existing open issues** in this repo:
   ```bash
   gh issue list --state open --search "keywords"
   ```

2. **If similar task exists:**
   - Do NOT create a duplicate
   - State: "There's already a task for this: #[number] - [title]"
   - Offer to add a comment or update the existing task if needed

3. **If no similar task exists:**
   - Proceed with creating the task

## What Counts as Duplicate

### Drafts
- Same thread ID (reply to same email)
- Same recipient + same subject line

### Tasks
- Same essential action (even if worded differently)
- Examples of duplicates:
  - "Pay Klarna bill" = "Betala Klarna" = "Klarna payment overdue"
  - "Call Sara" = "Ring Sara" = "Phone Sara"

## Response Templates

**When draft exists:**
> Draft already exists for [recipient/subject]. Current draft says: "[preview]". Want me to update it instead?

**When task exists:**
> Task already exists: #[number] - "[title]". Want me to add details or update it?

## Anti-Patterns

- Creating a new draft because the old one "might be outdated"
- Creating a task with slightly different wording
- Assuming no draft/task exists without checking
