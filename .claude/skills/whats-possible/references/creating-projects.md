# Creating New Projects

When a user says "Create a new project for [idea]", follow this process to scaffold a complete project repository.

Alfred OS has **two project templates**:

| Template | Path | Use When |
|----------|------|----------|
| **software-project** | `system/templates/software-project/` | Building deployable software (apps, websites, tools) |
| **project** | `system/templates/project/` | Non-software separate projects (learning journeys, knowledge work) |

The **software-project** template uses a flat structure (`docs/` for reference material) — source code goes at the root alongside framework-created folders. The **project** template uses the PARA four-folder pattern, which fits knowledge management better.

## Process

### 1. Gather Requirements

Ask what the project is about. You need at minimum:
- **Project name** (will become the repo name, e.g., `budget-tracker`)
- **Brief description** (1-2 sentences)
- **What they want to build** (app, website, tool, automation, etc.)
- **Is this software?** (determines which template to use)

### 2. Create the Repository

```bash
# Create a new private GitHub repo
gh repo create [project-name] --private --clone

# Navigate into it
cd ~/Projects/[project-name]
```

### 3. Copy the Appropriate Template

For **software projects**:
```bash
cp -rL ~/Projects/alfred-os/system/templates/software-project/. .
```

For **non-software projects** (learning, knowledge work):
```bash
cp -rL ~/Projects/alfred-os/system/templates/project/. .
```

**Why `-rL`?** The templates may use symlinks for shared files. `-L` follows them so the new project works as a standalone repo.

### 4. Fill In the Templates

Update these files with project-specific information:

**CLAUDE.md** — Replace all `{{PLACEHOLDER}}` values:
- `{{PROJECT_NAME}}` → The project name
- `{{PROJECT_DESCRIPTION}}` → Brief description
- `{{DOMAIN_OVERVIEW}}` → What the project is and what problem it solves
- `{{KEY_CONCEPTS}}` → Important terms and patterns for this domain
- `{{COMMON_PATTERNS}}` → Code patterns and conventions to follow
- `{{TROUBLESHOOTING}}` → Known gotchas (can start empty — will grow)
- `{{RESOURCES}}` → Links to docs, APIs, libraries
- `{{DATE}}` → Today's date
- `{{CURRENT_STATE}}` → "Project just created, no code yet."

**README.md** — Replace `{{PROJECT_NAME}}` and `{{PROJECT_DESCRIPTION}}`

**PRD.md** — Replace `{{PROJECT_NAME}}`, `{{PROJECT_DESCRIPTION}}`, `{{TECH_STACK}}`

### 5. Initialize Git and Push

```bash
git add -A
git commit -m "Initial project scaffold from Alfred OS template"
git push -u origin main
```

### 6. Make the Hooks Executable

```bash
chmod +x .claude/hooks/update-index.sh
```

### 7. Tell the User What's Next

For **software projects**:
```
Project "[name]" is set up!

Structure:
  docs/           ← Reference material, specs, research
  docs/solutions/ ← Bug fixes and workarounds
  scripts/        ← Ralph Loop and project scripts
  [your code]     ← Use whatever structure your framework creates

To start building:
  cd ~/Projects/[project-name]
  claude

To run tasks autonomously:
  1. Describe what you want built
  2. I'll create a PRD with checkboxes
  3. Run ./scripts/ralph.sh to let Claude work through them

What shall we build first?
```

For **non-software projects**:
```
Project "[name]" is set up!

Structure:
  1-key-areas/   ← Core project areas
  2-projects/    ← Features and milestones
  3-resources/   ← Reference material and solutions
  4-archive/     ← Completed work

To start building:
  cd ~/Projects/[project-name]
  claude

What shall we work on first?
```

## What Gets Copied

### Software project template

| Item | Purpose |
|------|---------|
| `CLAUDE.md` | Project-specific instructions (template with placeholders) |
| `README.md` | Project readme |
| `PRD.md` | Product requirements (for Ralph Loop) |
| `progress.md` | Ralph Loop iteration tracking |
| `docs/` | Reference material, specs, research |
| `docs/solutions/` | Non-obvious bug fixes and workarounds |
| `memory/` | Automatic memory system (daily logs + long-term) |
| `scripts/ralph.sh` | Autonomous execution loop |
| `state/` | Session checkpoint |
| `.claude/settings.json` | Hook configuration (memory, safety, auto-index) |
| `.claude/hooks/safety.sh` | Email + bash safety enforcement |
| `.claude/hooks/load-memory.sh` | Loads memory at session start |
| `.claude/hooks/update-index.sh` | Auto-index generation |
| `.claude/skills/prd/` | PRD generation for Ralph Loop |

### Non-software project template

| Item | Purpose |
|------|---------|
| `CLAUDE.md` | Project-specific instructions (template with placeholders) |
| `README.md` | Project readme |
| `PRD.md` | Product requirements (for Ralph Loop) |
| `progress.md` | Ralph Loop iteration tracking |
| `1-key-areas/` | PARA folder for core project areas |
| `2-projects/` | PARA folder for features/milestones |
| `3-resources/` | PARA folder for reference material |
| `4-archive/` | PARA folder for completed work |
| `memory/` | Automatic memory system (daily logs + long-term) |
| `scripts/ralph.sh` | Autonomous execution loop |
| `.claude/settings.json` | Hook configuration (memory, safety, auto-index) |
| `.claude/hooks/safety.sh` | Email + bash safety enforcement |
| `.claude/hooks/load-memory.sh` | Loads memory at session start |
| `.claude/hooks/update-index.sh` | Auto-index generation |
| `.claude/skills/prd/` | PRD generation for Ralph Loop |
