---
name: installing-skills
description: "Browse and install optional skills from the skills catalog. Use when: install skill, add skill, browse skills, what skills are available, show me skills, remove skill, uninstall skill, check for new skills, update skills, any new skills."
---

# Installing Skills

## Core Principle

Alfred OS ships with core skills that handle the essentials. Additional skills are available in the catalog (`system/skills-directory/`) organized by category. This skill helps you browse, install, and manage optional skills without touching the terminal.

## When to Use

- "What skills are available?"
- "Install [skill-name]"
- "Show me productivity skills"
- "Remove [skill-name]"
- "What skills do I have installed?"

## Process

### 1. Show What's Available

Scan `system/skills-directory/` for available skills. For each, read the SKILL.md frontmatter to get the name and description.

Present them organized by category, marking which are already installed:

```
Available Skills:

Productivity:
  prepping-meetings — Prepare concise briefs before meetings ✓
  time-audit — Track and analyze how you spend time
  working-with-notion — Add and manage content in Notion

Business:
  business-lead-research — Find and qualify business leads

Communication:
  reviewing-presentations — Review and develop presentations

Building:
  frontend-design — Create distinctive frontend interfaces

✓ = already installed
```

**Don't overwhelm.** If the user asked about a specific category or need, show only the relevant skills. Show the full catalog only when they ask for everything.

### 2. Install a Skill

When the user wants to install a skill:

1. Find the skill in `system/skills-directory/[category]/[skill-name]/`
2. Verify it exists and has a valid SKILL.md
3. Check it's not already installed in `.claude/skills/`
4. Create a symlink:
   ```bash
   ln -s ../../system/skills-directory/[category]/[skill-name] .claude/skills/[skill-name]
   ```
5. Confirm with a brief description of what they can now do:
   > "Installed **prepping-meetings**. Before any meeting, just say 'prep me for my next meeting' and I'll pull together context on who you're meeting and what to discuss."

### 3. Remove a Skill

When the user wants to remove an optional skill:

1. **Check that it's an optional skill** — it should be a symlink in `.claude/skills/`, not a real directory
2. Never remove core skills (real directories). If they try, explain: "That's a core skill — it ships with Alfred OS and can't be removed."
3. Remove the symlink:
   ```bash
   rm .claude/skills/[skill-name]
   ```
4. Confirm: "Removed **[skill-name]**. It's still in the catalog if you want it back."

### 4. Show Installed Skills

List everything in `.claude/skills/`:

- **Real directories** = core skills (always present, can't be removed)
- **Symlinks** = optional skills you've installed

To check which are which:
```bash
ls -la .claude/skills/
```

Symlinks show `->` pointing to `system/skills-directory/`.

### 5. Recommend Based on Context

When the user asks what they should install, tailor suggestions to what you know about them from CLAUDE.md:

- **Uses Google Calendar?** → prepping-meetings
- **Runs a business?** → business-lead-research
- **Does presentations?** → reviewing-presentations
- **Wants to build web apps?** → frontend-design
- **Uses Notion?** → working-with-notion
- **Curious about time management?** → time-audit

### 6. Check for New Skills

The Alfred OS template is updated regularly with new skills. Since this repo was cloned from the template and the user has read access to it, you can check for new skills that have been added since their last update.

**When the user asks:** "Are there new skills?", "Check for updates", "Any new skills available?"

1. Identify the template remote:
   ```bash
   git remote -v
   ```
   Look for a remote pointing to the Alfred OS template repo (usually `origin` or `upstream`).

2. Fetch the latest from that remote:
   ```bash
   git fetch origin main --quiet
   ```

3. Compare the remote's skills catalog with the local one:
   ```bash
   # List skills in the remote catalog
   git ls-tree -r --name-only origin/main:system/skills-directory/ | grep "SKILL.md"

   # List skills in the local catalog
   find system/skills-directory -name "SKILL.md"
   ```

4. For any new skills found on the remote but not locally:
   - Read their SKILL.md from the remote to get the description:
     ```bash
     git show origin/main:system/skills-directory/[category]/[skill-name]/SKILL.md
     ```
   - Present them to the user with descriptions
   - Offer to pull them in:
     ```bash
     git checkout origin/main -- system/skills-directory/[category]/[skill-name]
     ```

5. After pulling new skills, offer to install any that interest them (back to step 2).

**Example interaction:**
> "I checked the Alfred OS template and found 2 new skills since your last update:
>
> - **tracking-habits** (Productivity) — Track daily habits and visualize streaks
> - **writing-emails** (Communication) — Draft emails in your voice with structured templates
>
> Want me to add these to your catalog? Then you can install whichever ones interest you."

## Anti-Patterns

- Don't install skills the user didn't ask for
- Don't remove core skills
- Don't show the full catalog when they asked about one specific need
- Don't install without explaining what the skill does first
- Don't auto-pull new skills without asking — always show what's new and let the user decide
