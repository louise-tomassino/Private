# Claude Code Guide

What Claude Code is, how it works, and key concepts.

---

## What is Claude Code?

Claude Code is Claude with superpowers:
- Can read and write files
- Can run terminal commands
- Can connect to external services (email, calendar, sheets)
- Remembers your preferences via CLAUDE.md
- Has skills and commands for automated workflows

Think of it as Claude that can actually DO things, not just talk about them.

---

## Three Ways to Use Claude Code

### Option A: Claude Desktop App (Recommended)

The familiar Claude chat interface, with Claude Code capabilities built in.

**Best for:** Beginners - same interface you already know, no new software to learn.

**Install:** https://claude.ai/download (requires Pro subscription)

### Option B: Cursor

A code editor with Claude built in. Visual interface with:
- File browser on the left
- Code/files in the middle
- Chat with Claude on the right
- Browser preview at the bottom

**Best for:** Visual learners who want to see files changing in real-time.

**Install:** https://cursor.com

### Option C: Terminal

The original interface. Pure text, maximum power.

**Best for:** Developers comfortable with command line.

---

## Key Concepts

### CLAUDE.md

A markdown file that tells Claude who you are and how you work.

- Lives at the root of your project
- Claude reads it at the start of every conversation
- Your identity, preferences, systems, and workflows
- The more specific, the better Claude serves you

### Folder = Agent

**The folder you launch Claude Code from determines which agent you get.**

Each folder can have its own CLAUDE.md. When you open Claude Code in that folder, it reads that CLAUDE.md and becomes that "agent."

```
~/alfred/             → Your personal AI assistant (general purpose)
~/work/               → Your work agent (knows your job context)
~/Projects/my-app/    → Your app-building agent (knows the codebase)
```

**This is powerful:**
- Your work folder's CLAUDE.md knows about your company, your role, your projects
- Your app folder's CLAUDE.md knows the architecture, the tech stack, the conventions
- Each "agent" is specialized for its context

**The mental model:** Think of each CLAUDE.md as configuring a different specialist. Same Claude, different expertise based on where you are.

### Skills

Automated workflows that Claude triggers based on context.

Location: `.claude/skills/skill-name/SKILL.md`

Examples:
- `processing-inbox` - Email triage and response
- `creating-skills` - Meta-skill for building new skills

Triggered by natural language: "Process my inbox" activates the skill.

### Commands

Explicit actions you invoke with `/command-name`.

Location: `.claude/commands/command-name.md`

Examples:
- `/daily` - Morning sync
- `/weekly` - Monday planning

### MCP (Model Context Protocol)

Connections to external services:
- Gmail - Read/send emails
- Google Calendar - View/create events
- Google Sheets - Read/write data

Optional but powerful. See `system/guides/06-mcp-setup.md`.

---

## How Claude Code Works

1. **You talk to Claude** (via Cursor, Desktop, or Terminal)
2. **Claude reads CLAUDE.md** to understand your context
3. **Claude uses tools** to read files, run commands, call APIs
4. **Claude responds** with results and takes actions

You don't need to know how to code. Claude handles that. You just describe what you want.

---

## What You Can Build

- Personal dashboards
- Task management systems
- Email workflows
- Automated reports
- Custom tools
- Full web applications

The barrier isn't technical skill - it's clearly describing what you want.

---

## The "Non-Technical" Myth

"Non-technical" is becoming meaningless. If you can:
- Describe what you want clearly
- Give feedback when something's wrong
- Iterate on ideas

...you can build software with Claude Code.

You're not learning to code. You're learning to direct an AI that codes.

---

## Going Deeper

For details on plan mode, permissions, and settings, see `system/guides/02b-operating-claude-code.md`.

---

*Next: Set up voice dictation in `system/guides/03-wispr-flow-guide.md`*
