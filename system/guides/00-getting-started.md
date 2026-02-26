# Getting Started

Your first session with Alfred OS. Instead of reading docs, you'll have a conversation.

---

## Prerequisites

Before starting, you need:

1. **Claude Pro** ($20/mo) - enables Claude Code
2. **Claude Desktop** - download from claude.ai
3. **GitHub account** - free at github.com
4. **Wispr Flow** (recommended) - voice dictation, $10/mo or free tier

---

## Step 1: Get Your Tools Ready

Open Claude Desktop and say:

> "Help me get set up. I need to connect to GitHub and download Alfred OS."

Claude will walk you through each step — just follow along. You don't need to understand the technical details.

If Claude asks for your GitHub username, give it. If it suggests installing something, say yes.

---

## Step 2: Start Onboarding

Open a new Claude conversation from your `alfred` folder (renamed from `alfred-os-template` during setup) and say:

> "Get me started"

That's it. Claude will:

1. **Interview you** - Ask about your name, role, family, what tools you use
2. **Set up your personal space** - Organize your docs folder and create task labels
3. **Connect your tools** - Help with Gmail, Calendar, Sheets if you want them
4. **Train you** - Create your first tasks, run /daily, show you how it works

The whole process takes 20-30 minutes, and you can stop anytime. Your progress is saved in CLAUDE.md, so you can say "continue onboarding" to pick up where you left off.

---

## What You're Setting Up

```
Alfred OS (this repo) = your personal home base
    Tasks: GitHub Issues (with labels)
    Info: 1-key-areas/ 2-projects/ 3-resources/ 4-archive/
    ↓ optionally connects to
┌────────────┬────────────┐
│   WORK     │   FAMILY   │  ← Only if you need them
│   REPO     │   REPO     │
└────────────┴────────────┘
    ↓ optionally connects to
┌──────────┬──────────┬──────────┐
│  Gmail   │ Calendar │  Sheets  │
│  (MCP)   │  (MCP)   │  (MCP)   │
└──────────┴──────────┴──────────┘
```

Alfred OS is your **personal home base** — it contains your system configuration, your tasks, and your personal documents. If you need separate spaces for work or family, those can be added later.

---

## After Onboarding

You'll have a working AI operating system. The path forward:

| When | What | How |
|------|------|-----|
| **Daily** | Use it | Talk to Claude naturally |
| **Week 1** | Build your agent | Read `system/guides/01-philosophy.md` |
| **When ready** | Build software | Say "Create a new project" |

---

## Quick Reference

| You say... | Claude does... |
|------------|----------------|
| "Get me started" | Start/continue onboarding |
| "What are my tasks?" | Query all your tasks |
| "Add a family task: X" | Create labeled GitHub issue |
| "/daily" | Morning sync |
| "Process my inbox" | Email workflow |

---

## Troubleshooting

**"gh: command not found"**
Ask Claude to help you install GitHub CLI.

**Onboarding interrupted**
Say "continue onboarding" to resume.

**Want to start over**
Delete the "Onboarding Status" section from CLAUDE.md and say "get me started" again.

---

*Next: Say "get me started" and let Claude guide you through the rest.*
