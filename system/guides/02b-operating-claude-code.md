# Operating Claude Code

How to work with plan mode, permissions, and settings.

---

## Permission Prompts

Claude Code asks permission before doing certain things:
- Writing or editing files
- Running terminal commands
- Accessing external services

**When you see a permission prompt:**
- Read what Claude wants to do
- Click "Allow" or "Deny"
- Or type your response

This is a safety feature - Claude won't make changes without your approval.

---

## How Alfred Keeps You Safe

Alfred uses three layers of protection. See `system/guides/11-security.md` for the full security guide.

### Layer 1: The Sandbox

Claude Code's built-in sandbox restricts what commands can do on your computer:
- **Files:** Can only write to your Alfred OS folder. Can't touch your system files, SSH keys, or other sensitive areas.
- **Network:** Can only connect to domains you've approved. New domains require your OK.
- **Everything Claude runs** inherits these restrictions — scripts, build tools, subprocesses.

Enable it by running `/sandbox` in Claude Code. On Mac, it works immediately with no setup.

### Layer 2: Safety Hooks

Certain actions always require your explicit approval, no matter what:
- **Sending emails:** Claude creates drafts. You review and approve before anything is sent.
- **Trashing emails:** You confirm before any email is permanently deleted.
- **Destructive commands:** Things like `rm -rf` or `git push --force` always ask first.

These are enforced by the system, not by Claude's judgment. Even a sophisticated attack can't bypass them.

### Layer 3: Permission Prompts

For everything else, Claude asks before:
- Writing or editing files
- Running terminal commands
- Accessing external services

**When you see a permission prompt:** Read what Claude wants to do. Click "Allow" or "Deny."

### Reducing Prompts

If you find the permission prompts too frequent:

**Option 1: Allow for Session** — When prompted, choose "Allow for this session." Claude won't ask again for similar actions during this conversation.

**Option 2: Trust Mode** — For maximum speed, you can enable trust mode where Claude acts without asking for most things.

**With the sandbox and safety hooks active, Trust Mode is much safer than it sounds.** Claude still can't send emails without your approval, can't access files outside your project, and can't connect to unapproved domains. Trust Mode only removes the prompt for routine operations like editing files and running build commands.

**Warning:** Do NOT use Trust Mode if you haven't enabled the sandbox first. Without the sandbox, Trust Mode gives Claude unrestricted access to your entire system.

---

## Plan Mode

For complex tasks, Claude enters "plan mode" - it researches and proposes a plan before making changes.

### What Triggers Plan Mode

- Complex multi-step tasks
- Architectural decisions
- When Claude is unsure of the best approach

### How It Works

1. Claude explores the codebase (read-only)
2. Claude writes a plan
3. You review and approve (or give feedback)
4. Claude executes the plan

### During Plan Mode

- Claude can only READ files, not edit
- No terminal commands that change things
- You'll see "Plan Mode" indicator

### Exiting Plan Mode

- Approve the plan → Claude starts implementing
- Give feedback → Claude revises
- Cancel → Claude abandons the plan

---

## Memory Between Sessions

Claude Code can remember things between conversations.

### CLAUDE.md (Project Memory)

Your CLAUDE.md file is read at the start of every conversation. Put preferences here for persistence.

### Memory Feature

Claude can store memories about you and your preferences. These persist across projects.

**To add a memory:**
```
Remember that I prefer TypeScript over JavaScript
```

**To see memories:**
```
What do you remember about me?
```

### Conversation History

Each conversation starts fresh. Alfred's memory system automatically preserves important context across sessions via daily logs and long-term memory.

---

## Settings Overview

### Claude Desktop Settings

- **Claude Code toggle** - Enable/disable Claude Code features
- **Permissions** - Configure auto-approval
- **Memory** - Manage stored memories

### Cursor Settings

- **Extension settings** - Claude Code specific options
- **Keybindings** - Shortcuts for common actions

---

## Tips for Smooth Operation

### 1. Be Specific About Scope

Instead of "fix the bug," say "fix the login bug in auth.ts"

Claude works better with clear boundaries.

### 2. Let Claude Explore First

For unfamiliar codebases, let Claude read files before asking for changes.

```
Read through the src/ folder and summarize the architecture
```

### 3. Trust But Verify

Review what Claude produces, especially for:
- External API calls
- Database operations
- Anything that can't be easily undone

---

## Common Issues

**Claude keeps asking permission**
→ Use "Allow for session" or adjust settings

**Claude went into plan mode when I didn't want it**
→ Say "just do it, don't plan" for simple tasks

**Claude forgot what we discussed**
→ Context resets each conversation. Alfred's memory system captures key learnings automatically. For permanent preferences, add to CLAUDE.md.

**Claude made a mistake**
→ Say "undo that" or manually revert. Git history helps here.

---

*Next: Set up voice dictation in `system/guides/03-wispr-flow-guide.md`*
