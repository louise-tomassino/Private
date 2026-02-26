# Repository Strategy

When to create new repos vs work in existing ones.

---

## Types of Repos

### 1. Alfred OS (Your Home Base)

**What it is:** This repository. Your AI operating system AND your personal space.

**Contains:**
- Your identity and preferences (CLAUDE.md)
- Skills and commands
- Documentation and guides
- Your personal tasks (GitHub Issues)
- Your information organized in numbered folders (1-key-areas/, 2-projects/, 3-resources/, 4-archive/) — works for personal and business repos alike
- Configuration for connected tools

**When to work here:**
- Adding tasks: "Add a task: Review Q1 budget"
- Creating personal documents: "Create a doc about vacation plans"
- Checking tasks: "What are my tasks?"
- Updating your preferences
- Adding new skills
- Modifying how Alfred works

---

### 2. Category Repos (Optional Add-ons)

**What they are:** Separate repos for life domains that need their own space. Most people don't need these right away.

**Contains:**
- Tasks (GitHub Issues)
- Documents (markdown files in docs/)
- Domain-specific notes and references

**When to create one:**
- You work with a team and want to share a task list
- You want to share family tasks with family members
- You have a strong preference for separating work from personal

**Examples:**
- `work` or `[company-name]` - Shared professional tasks
- `family` - Shared household tasks, kid activities

**When you don't need one:** If you're the only person using it, labels in Alfred OS work just as well.

---

### 3. Projects (Codebases)

**What they are:** Standalone repos for software projects or deep domain learning.

**Contains:**
- Project-specific CLAUDE.md (domain knowledge)
- Code, config, documentation
- PRD and progress tracking for autonomous work

**When to create one:**
- Building an app or tool
- Learning a new technology deeply
- Any work that needs its own codebase
- Projects that will have multiple files

---

## Decision Tree: Where Should I Work?

```
Is this a task or reminder?
  ├─ Personal? → GitHub Issue on this repo (label: personal)
  ├─ Work? → This repo (label: work) or work repo if separate
  └─ Family? → This repo (label: family) or family repo if separate

Is this a personal document?
  └─ Yes → appropriate numbered folder in this repo

Is this a work or family document?
  ├─ Separate repo exists? → That repo's docs/
  └─ No separate repo? → appropriate numbered folder

Am I building software?
  └─ Yes → New Project repo

Am I learning a technology deeply?
  └─ Yes → New Project repo (learning type)

Is this about how Alfred works?
  └─ Yes → Alfred OS (CLAUDE.md, skills, commands)

Is this a standalone tool or app?
  └─ Yes → New Project repo
```

---

## When to Create a New Project

**Create a new project repo when:**

1. **You're building software** - Any app, tool, script, or website
2. **You're learning a technology** - ComfyUI, Home Assistant, a new programming language
3. **It needs its own CLAUDE.md** - Different context than your main Alfred OS
4. **It will have multiple files** - Code, config, assets
5. **It might be shared or deployed** - Has a life beyond just your tasks

**Don't create a new repo when:**

1. **It's just a task** - Use a GitHub Issue (in this repo or a category repo)
2. **It's a one-off document** - Put it in the appropriate folder (1-key-areas/, 3-resources/, etc.) or a category repo
3. **It's a quick script** - Ask Claude to run it, don't scaffold a project
4. **You're not sure yet** - Start with a conversation, create repo when scope is clear

---

## Creating a New Project

Say "Create a new project for [X]" and the `creating-projects` skill handles it:

1. **Interviews you** - What are you building? What's the goal?
2. **Researches** - Gathers domain knowledge, best practices
3. **Scaffolds** - Creates repo with CLAUDE.md, structure, tooling
4. **Prepares Claude** - CLAUDE.md makes Claude instantly expert

The result: A repo where Claude immediately understands the domain and can help you build.

---

## Project Types

The creating-projects skill produces different outputs:

### Software Development Project

For building apps, tools, websites:

```
project-name/
├── CLAUDE.md          # Domain knowledge + dev patterns + security
├── PRD.md             # Task breakdown for Ralph Loop
├── progress.md        # Iteration learnings
├── README.md          # Project overview
├── .claude/           # Skills, commands, and security
│   ├── commands/
│   ├── hooks/
│   │   └── safety.sh  # Security enforcement
│   ├── settings.json  # Hook registration
│   └── skills/
├── docs/              # Documentation
├── plans/             # Feature plans
└── scripts/           # Automation (ralph.sh)
```

### Learning/Domain Project

For exploring a technology without building:

```
project-name/
├── CLAUDE.md          # Domain knowledge + security
├── README.md          # What this is
├── .claude/
│   ├── hooks/
│   │   └── safety.sh  # Security enforcement
│   └── settings.json  # Hook registration
└── docs/              # Notes and learnings
```

---

## Working Across Repos

You can reference other repos in conversations:

```
"Check my work tasks and add the urgent ones to my calendar"
```

Claude knows about your categories from Alfred OS's CLAUDE.md and can work across them.

For project repos, you typically open a conversation **from that folder**:
```bash
cd ~/Projects/my-app
# Now Claude has my-app's CLAUDE.md context
```

---

## Task vs Project Examples

| Situation | Where | Why |
|-----------|-------|-----|
| "Buy groceries" | This repo (label: family) | It's a task |
| "Plan Sarah's birthday party" | This repo (label: family) | It's a task, maybe with checklist |
| "Research best CRM options" | This repo (label: work) or work repo | Document/task, work domain |
| "Build a CRM for my business" | New project repo | Software project |
| "Learn how Kubernetes works" | New project repo (learning) | Deep domain learning |
| "Deploy app to Kubernetes" | Existing project repo | Part of that project |
| "Add a skill for daily standups" | Alfred OS | Modifying your AI system |

---

## Tips

### Start Small
Not sure if something needs a project? Start with a conversation. If it grows complex, then create a repo.

### One Project, One Purpose
Don't cram multiple unrelated things into one project repo. Each project should have a clear focus.

### Life Admin Lives Here
Tasks, reminders, documents about your life — that lives in Alfred OS (or optional category repos). Code and tools get their own projects.

### Keep Things Organized
System docs live in `system/guides/`. Your information goes in the numbered folders (1-key-areas/, 2-projects/, 3-resources/, 4-archive/).

---

*Next: Learn how to build software in `system/guides/09-building-software.md`*
