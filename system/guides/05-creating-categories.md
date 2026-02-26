# Setting Up Your Categories

How to organize tasks and documents in Alfred OS.

---

## Overview

Alfred OS is your personal home base. Your tasks and documents already live here — no extra setup needed for personal use.

You organize tasks using **labels** on GitHub Issues:

| Label | Purpose |
|-------|---------|
| `work` | Work-related tasks |
| `personal` | Personal tasks |
| `family` | Family-related tasks |
| `today`, `this-week`, `this-month`, `later` | Priority levels (Orbit-compatible) |
| `todo`, `in-progress`, `blocked` | Status tracking |

If you need a **separate space** for work (team collaboration) or family (shared with family members), you can add those as optional repos.

---

## Step 1: Understand Your Folder Structure

Alfred OS organizes your information in four numbered folders:

```
1-key-areas/       # Ongoing parts of your life or business (health, finances, marketing...)
2-projects/    # Active initiatives with an end goal
3-resources/   # Reference material (contacts, guides, research)
4-archive/     # Done or inactive
```

Subfolders inside each are created during onboarding based on your life — you don't need to set them up manually.

---

## Step 2: Create Category Labels

Set up labels to organize your tasks:

```bash
# Category labels
gh label create "work" --color "0075ca" --description "Work tasks"
gh label create "personal" --color "008672" --description "Personal tasks"
gh label create "family" --color "d876e3" --description "Family tasks"

# Priority labels (Orbit-compatible)
gh label create "today" --color "d73a4a" --description "Must do today"
gh label create "this-week" --color "fbca04" --description "Do this week"
gh label create "this-month" --color "c5def5" --description "Do this month"
gh label create "later" --color "0e8a16" --description "No immediate timeline"

# Status labels
gh label create "todo" --color "e4e669" --description "Not started"
gh label create "in-progress" --color "1d76db" --description "Currently working on"
gh label create "blocked" --color "b60205" --description "Waiting on something"
```

---

## Step 3: Test It

Try creating a task:

```
Add a work task: Review Q1 budget
```

Claude should create a GitHub Issue on this repo with the `work` label.

Try listing tasks:

```
What are my work tasks?
```

---

## Step 4 (Optional): Create a Separate Work Repo

Only needed if you **work with a team** and want to keep work tasks in their own space.

### On GitHub:

1. Go to https://github.com/new
2. Create the repo:
   - Name: Whatever makes sense for your work
   - Visibility: Private
   - Initialize with README: Yes

### Add structure:

```
work-repo/
├── CLAUDE.md              # Must include Security section
├── .claude/
│   ├── hooks/
│   │   └── safety.sh      # Security enforcement (copy from alfred)
│   └── settings.json      # Hook registration
├── 1-key-areas/
├── 2-projects/
├── 3-resources/
├── 4-archive/
└── .gitignore
```

### Add security files:

Copy the security hook and settings from Alfred OS:
```bash
mkdir -p .claude/hooks
cp ~/Projects/alfred/.claude/hooks/safety.sh .claude/hooks/safety.sh
chmod +x .claude/hooks/safety.sh
cp ~/Projects/alfred/.claude/settings.json .claude/settings.json
```

Make sure CLAUDE.md includes the Security section (see Alfred OS CLAUDE.md for the template).

### Update CLAUDE.md:

Add the repo to your Task Management table so Claude knows to route work tasks there.

---

## Step 5 (Optional): Create a Separate Family Repo

Only needed if you **share tasks with family members**.

### On GitHub:

1. Go to https://github.com/new
2. Create the repo:
   - Name: `family`
   - Visibility: Private (invite family members later)
   - Initialize with README: Yes

### Add structure:

```
family/
├── CLAUDE.md              # Must include Security section
├── .claude/
│   ├── hooks/
│   │   └── safety.sh      # Security enforcement (copy from alfred)
│   └── settings.json      # Hook registration
├── 1-key-areas/
├── 2-projects/
├── 3-resources/
├── 4-archive/
└── .gitignore
```

### Add security files:

Copy the security hook and settings from Alfred OS:
```bash
mkdir -p .claude/hooks
cp ~/Projects/alfred/.claude/hooks/safety.sh .claude/hooks/safety.sh
chmod +x .claude/hooks/safety.sh
cp ~/Projects/alfred/.claude/settings.json .claude/settings.json
```

Make sure CLAUDE.md includes the Security section (see Alfred OS CLAUDE.md for the template).

### Invite family members:

1. Go to repo Settings → Collaborators
2. Add family members by GitHub username or email
3. They can then view and edit tasks and docs

### Update CLAUDE.md:

Add the repo to your Task Management table.

---

## Step 6: Update CLAUDE.md

Fill in the Task Management section with your actual setup:

**Single repo (most common):**
```markdown
| Category | Repository | Purpose |
|----------|------------|---------|
| **Personal** | `your-username/alfred` (this repo) | All tasks |
```

**With separate repos:**
```markdown
| Category | Repository | Purpose |
|----------|------------|---------|
| **Personal** | `your-username/alfred` (this repo) | Personal tasks |
| **Work** | `your-username/your-work-repo` | Work tasks |
| **Family** | `your-username/family` | Shared family tasks |
```

---

## Tips

### Keep it Simple

Start with just this repo and labels. Add separate repos later if you find you need them.

### Tasks vs Documents

- **Tasks** = GitHub Issues (things to do)
- **Documents** = Markdown files in the numbered folders: `1-key-areas/`, `2-projects/`, `3-resources/`, `4-archive/` (reference and domain info)

### Labels for Organization

Beyond the basics, consider adding labels for:
- Specific projects: `website-redesign`, `q1-planning`
- Type: `quick-win`, `research`

---

## Next Steps

Once your categories are set up:

1. **Try /daily** - Run the daily sync command
2. **Add some tasks** - Populate your system
3. **Set up MCP** (optional) - Add email and calendar

---

*Next: Connect Gmail and Calendar in `system/guides/06-mcp-setup.md`*
