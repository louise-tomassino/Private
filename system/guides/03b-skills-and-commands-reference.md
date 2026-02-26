# Skills & Commands Reference

Everything Alfred OS can do out of the box.

---

## How Skills and Commands Work

| Type | How to Use | Best For |
|------|------------|----------|
| **Skills** | Natural language ("Process my inbox") | Complex workflows with decisions |
| **Commands** | Explicit (`/daily`) | Direct actions, one-shot tasks |

**Skills** live in `.claude/skills/` and are triggered when Claude recognizes your intent.

**Commands** live in `.claude/commands/` and are invoked with a `/` prefix.

---

## Pre-Packaged Skills

Skills are divided into **core** (ship with Alfred OS from day one) and **optional** (available from the Pennyworth Skills Directory, added based on your needs).

### Core Skills

These ship with Alfred OS and are introduced during onboarding:

| Skill | Purpose |
|-------|---------|
| **onboarding** | Initial setup and learning progression |
| **processing-inbox** | Email triage, response drafting, digests |
| **creating-skills** | Build custom workflows and automations |
| **whats-possible** | Discover what Alfred OS can do, with examples |
| **troubleshooting** | Diagnose and fix setup issues |

### Optional Skills

Available from the Pennyworth Skills Directory. These are vetted starter skills you install and customize based on your needs:

| Skill | Category | Purpose |
|-------|----------|---------|
| **starting-new-things** | Productivity | Determine the right container for new initiatives |
| **prepping-meetings** | Productivity | Gather context and create briefs before meetings |
| **time-audit** | Productivity | Track and analyze how you spend time |
| **working-with-notion** | Productivity | Add and manage content in Notion |
| **business-lead-research** | Business | Sales research and lead qualification |
| **managing-finances** | Business | Track invoices, receipts, and bookkeeping |
| **building-voice** | Communication | Define brand/personal communication style |

Ask your Alfred facilitator to install any of these, or use the `installing-skills` skill when available.

---

### onboarding

**Trigger phrases:** "Get me started", "I'm new", "onboard me", "configure Alfred"

Sets up Alfred OS through conversation. Interviews you about who you are, sets up your personal space and task labels, connects tools, and trains you on the basics.

Use "continue onboarding" to resume if interrupted.

---

### processing-inbox

**Trigger phrases:** "Process my inbox", "check flagged emails", "email triage"

**Requires:** Gmail MCP configured

Processes your starred/flagged emails:
1. Categorizes each as "respond" or "read later"
2. Drafts responses for respond items
3. Creates digest summaries for read-later items
4. Unflags processed emails

---

### whats-possible

**Trigger phrases:** "What can I do?", "what's possible?", "show me what you can do", "now what?"

Shows you what Alfred OS can do, tailored to your setup and situation:
1. Checks what you have configured (repos, MCPs, learning progress)
2. Picks 3-5 relevant capabilities based on your context
3. Gives concrete examples using your actual setup
4. Makes it actionable — you can try each suggestion immediately

Use when you're not sure what to do next or want inspiration.

---

### creating-skills

**Trigger phrases:** "Create a skill for X", "add a capability", "automate this workflow"

Meta-skill for building new skills. Helps you define:
- When the skill should trigger
- What steps it should follow
- What context it needs

Creates the skill file in `.claude/skills/`.

---

## Pre-Packaged Commands

### /daily

**Purpose:** Morning sync

Quick check-in that shows:
- Today's calendar
- This week's focus areas
- Today's top 3 priorities
- Anything needing attention

Run this each morning to start your day oriented.

---

### /weekly

**Purpose:** Monday planning

Comprehensive weekly review:
- What got done last week
- This week's calendar overview
- Open tasks across all categories
- Suggested "big rocks" for the week

Run this Monday mornings to plan your week.

---

## Discovering Skills & Commands

### In Claude Desktop / Cursor

Type `/` to see available commands in a picker.

For skills, just describe what you want naturally - Claude will activate the right skill.

### Finding What's Available

```
ls .claude/skills/
ls .claude/commands/
```

Or ask Claude: "What skills do you have?"

---

## Creating Your Own

### New Skill

Say "Create a skill for [workflow]" and the `creating-skills` skill will guide you.

Or manually create `.claude/skills/skill-name/SKILL.md`.

### New Command

Create `.claude/commands/command-name.md` with:
```markdown
---
description: "What this command does"
---

# Command Name

[Instructions for Claude to follow]
```

---

*Next: Learn about context management in `system/guides/03c-context-and-handoffs.md`*
