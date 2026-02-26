---
name: starting-new-things
description: "Determine the right container for new initiatives. Use when: start something new, create project, new skill, build something, learn something, new workflow, bootstrap."
---

# Starting New Things

## Core Principle

Not everything needs a separate project. Match the container to what you're actually doing.

## When to Use

- "I want to start X"
- "Help me build/create/learn Y"
- "Set up a project for Z"
- "Create a workflow for X"
- "I need to track/manage Y"

## The Five Containers

| Container | What Gets Created | When to Use |
|-----------|-------------------|-------------|
| **Skill only** | Skill in `.claude/skills/` | Repeatable workflows, no artifacts needed |
| **Folder + Skill** | `2-projects/[name]/` + managing skill | Artifacts needed, but no specialized domain knowledge |
| **Separate project** | `~/Projects/[name]/` with CLAUDE.md | Extended learning journeys, dedicated context needed |
| **Orbit widget** | `widgets/[name]/` in Orbit repo | Lightweight data display — no separate app needed |
| **Software repo** | `~/Projects/[name]/` + GitHub | Full deployable software with complex interactions |

## Phase 1: Triage

Ask these questions to determine the right container:

### Question 1: Software?
**"Are you building software that will be deployed or used by others?"**
- Yes → **Software route** (skip to Phase 2B — which includes the Orbit widget check)
- No → Continue

### Question 2: Workflow vs Initiative?
**"Is this primarily a repeatable process/workflow, or an initiative with artifacts?"**
- Repeatable workflow, no files needed → **Skill only** (handoff to creating-skills)
- Initiative with artifacts → Continue

### Question 3: Extended context needed?
**"Will you spend extended sessions working in this context, where dedicated Claude knowledge would help?"**

Signs you need a separate project:
- Learning journey (Rust, ML, a new technology)
- Client/isolated work that should be walled off
- Collaboration (others need the context too)
- Different operating mode (specific voice, approach)

Signs you don't:
- Alfred already knows how to do this (write, organize, research)
- You'll invoke it occasionally, not live in it
- It's more about workflow than domain knowledge

- Yes, extended context → **Separate project** (Phase 2A)
- No → **Folder + Skill** (Phase 2A)

### Confirm with user
```
Based on what you've described, this sounds like a [container type].

[Brief explanation of why]

I'll create:
- [What will be created]

Does that sound right?
```

## Phase 2A: Non-Software Routes

### Skill Only

When triage determines this is a pure workflow:

1. **Gather context** for the skill:
   - What should the skill accomplish?
   - What triggers would invoke it?
   - What are the key steps?

2. **Hand off to creating-skills** with this context:
   ```
   This is a workflow I can learn as a skill. Let me create it.

   Skill purpose: [what it does]
   Triggers: [how you'll invoke it]
   Process: [key steps]
   ```

3. Follow the creating-skills process.

### Folder + Skill

When there are artifacts but no specialized domain knowledge:

1. **Design folder structure** based on use case:
   ```
   2-projects/podcast/
   ├── episodes/
   ├── guests/
   ├── scripts/
   └── assets/
   ```

2. **Create the folder**:
   ```bash
   mkdir -p 2-projects/[name]/[subfolders]
   ```

3. **Create a managing skill** in `.claude/skills/managing-[name]/SKILL.md`:
   - How to work with the folder structure
   - Key workflows (e.g., "plan new episode", "research guest")
   - Quality markers

4. **No git needed** — folder is inside Alfred OS which is already versioned.

### Separate Project (Non-Software)

When dedicated Claude context is needed:

1. **Discovery** - Understand the domain:
   - What's the goal?
   - Experience level?
   - Any constraints?
   - Engagement mode (hands-off vs collaborative)?

2. **Research** - If domain knowledge is needed:
   - Use WebSearch/WebFetch to research deeply
   - Write findings to `3-resources/research-[domain].md`
   - Cover: overview, key concepts, common patterns, troubleshooting

3. **Calibrate** - Present summary and verify understanding

4. **Scaffold** using the project template:
   ```bash
   gh repo create [project-name] --private --clone
   cd ~/Projects/[project-name]
   cp -rL ~/Projects/alfred-os/system/templates/project/. .
   ```

   **Why `-rL`?** The template uses symlinks for shared files. `-L` follows them so the new project works standalone.

5. **Remove dev files** (since not building software). Confirm with the user before running:
   ```bash
   rm -rf scripts/ PRD.md progress.md
   rm -rf .claude/skills/prd/
   ```

6. **Customize CLAUDE.md** with researched domain knowledge

7. **Suggest relevant skills from the catalog**

   Check `~/Projects/alfred-os/system/skills-directory/` for optional skills that would be useful for this project. Read each skill's SKILL.md frontmatter to understand what it does, then suggest any that match the project's domain.

   For example:
   - Writing/content project → `reviewing-presentations`
   - Business project → `business-lead-research`
   - Productivity project → `time-audit`, `working-with-notion`

   If the user wants any:
   ```bash
   cp -rL ~/Projects/alfred-os/system/skills-directory/[category]/[skill-name] .claude/skills/[skill-name]
   ```

   **Use `cp -rL`, not symlinks** — the new project is standalone and won't have access to Alfred OS's directory structure.

   If nothing seems relevant, skip this step. Don't force it.

8. **Initialize git** (local by default):
   ```bash
   git add .
   git commit -m "Initial commit: [domain] learning project"
   ```

   Mention GitHub is available if they want backup/sharing.

## Phase 2B: Software

When building deployable software. Uses the **software-project** template (lighter structure without PARA folders — source code lives at the root alongside `docs/`).

### Step 1: Determine Software Archetype

Before jumping to a repo, figure out what's actually being built. The archetype shapes every decision that follows.

**Ask:** "What are you building — and who's it for?"

| Archetype | Signals | What it means |
|-----------|---------|---------------|
| **Landing page / marketing site** | "website", "landing page", "portfolio", "brochure site" | Static-first, animations, SEO, no database |
| **Web app** | "app", "dashboard", "platform", login/users | Full-stack, database, auth, state management |
| **CLI tool** | "command line", "script", "automation" | Minimal deps, single entry point |
| **API / backend** | "API", "server", "microservice" | Framework, database, deployment |
| **Orbit widget** | "dashboard", "tracker", "digest", "monitor" | Markdown + cron script in Orbit — no separate app needed |

#### The Orbit Widget Check

**Before recommending a full software project**, consider whether an Orbit widget would be enough. Many things people want to "build an app for" are really just:
- A data display that updates periodically (news digest, finance tracker, weather)
- A simple dashboard of information from APIs
- A personal tracker that doesn't need multi-user or complex interactions

**An Orbit widget is just:**
1. A script that fetches data and generates markdown (runs via cron or manually)
2. A `_widget.json` metadata file
3. Markdown files in a GitHub repo folder
4. Orbit renders it on the canvas alongside tasks and pages

**Suggest a widget when:**
- The data is generated externally (API calls, aggregation, summaries)
- Display is read-only or mostly read-only
- No complex interactions needed (forms, real-time collaboration, rich editing)
- The user wants it visible on their Orbit dashboard
- No database or auth required

**Suggest a full app when:**
- Complex interactions (multi-step forms, drag-and-drop, real-time features)
- Multiple users or public-facing
- Needs its own URL / deployment
- Rich state management beyond what GitHub Issues can handle
- Specialized UI (maps, video, canvas drawing)

If a widget fits, skip the rest of Phase 2B — create the widget folder in the user's Orbit repo and generate the cron script. Otherwise, continue with a full software project.

### Step 2: Discovery

- What are you building? (purpose, users, scope)
- What's the tech stack? (or should I recommend one?)
- Solo or collaboration?
- Any constraints? (offline, specific platform, existing systems to integrate with)

### Step 3: Stack Selection

#### AI-Friendly Tech Principles

When recommending a stack, **prioritize technologies that work well with AI-assisted development.** This matters more than personal preference or theoretical performance — a stack Claude can work with fluently will ship faster and with fewer bugs.

**Prefer:**
- **Libraries with AI documentation** — look for `llms.txt`, AI-specific docs, or MCP servers (e.g., Next.js publishes llms.txt, shadcn has an MCP server)
- **Copy-paste component libraries** over config-heavy ones — Claude can read and modify source code directly (e.g., shadcn/ui) but struggles with components buried in node_modules behind configuration layers
- **Utility CSS** over CSS-in-JS — Tailwind classes are self-documenting in the markup; styled-components require tracing through abstractions
- **Readable output** over magic — prefer libraries where the generated code is visible and modifiable, not black-box configs
- **Widely-used frameworks** with large representation in training data — mainstream choices mean better AI assistance

**Always research before recommending.** Don't rely on training data alone — use `WebSearch` to check:
- "[framework] llms.txt" or "[framework] AI docs" — does it publish AI-optimized docs?
- "[library] MCP server" — is there tool integration?
- "best [archetype] stack [current year]" — what's current?

Libraries and best practices change fast. A quick search catches things like renamed packages, new AI features, or better alternatives that emerged after training data cutoff.

#### Stack Examples by Archetype

These are **starting points to adapt**, not rigid prescriptions. If something better exists, use that instead.

**Landing page / marketing site:**
Next.js + Tailwind CSS + shadcn/ui (Base UI) + animation library + dark mode support
(SEO-friendly, static generation, component library Claude can modify directly)

**Web app:**
Next.js + Tailwind CSS + shadcn/ui (Base UI) + ORM + auth library
(Full-stack in one framework, type-safe database access)

**CLI tool:**
Node.js or Python with minimal dependencies, argument parsing library
(Small surface area, easy to test, no build step needed)

**API / backend:**
Lightweight framework + ORM + validation library
(Match to deployment target — serverless vs long-running)

> **shadcn/ui note:** When setting up shadcn, choose **Base UI** as the primitive library (not Radix). Base UI is actively maintained with better component coverage and a cleaner API. The `npx shadcn create` command will prompt you to choose — pick Base UI. Component APIs are identical regardless of which library renders underneath.

### Step 4: Scaffold

1. **Create repo and copy template**:
   ```bash
   gh repo create [project-name] --private --clone
   cd ~/Projects/[project-name]
   cp -rL ~/Projects/alfred-os/system/templates/software-project/. .
   ```

   **Note:** This uses the `software-project` template (not `project`). It gives you `docs/` for reference material and `docs/solutions/` for workarounds, but no PARA folders — your framework's structure (src/, app/, lib/, etc.) goes at the root.

2. **Keep all files** (PRD.md, scripts/, etc.)

3. **Customize CLAUDE.md** with:
   - Tech stack specifics (versions, packages, why they were chosen)
   - Architecture decisions
   - Development patterns
   - Links to AI docs (llms.txt URLs, MCP server configs)

4. **Customize PRD.md** with:
   - Project goals
   - Initial tasks with acceptance criteria

5. **Suggest relevant skills from the catalog**

   Check `~/Projects/alfred-os/system/skills-directory/` for optional skills that would be useful for this project. Read each skill's SKILL.md frontmatter to understand what it does, then suggest any that match what's being built.

   For example:
   - Building a web app → `frontend-design`
   - Building a business tool → `business-lead-research`
   - Project involves presentations → `reviewing-presentations`

   If the user wants any:
   ```bash
   cp -rL ~/Projects/alfred-os/system/skills-directory/[category]/[skill-name] .claude/skills/[skill-name]
   ```

   **Use `cp -rL`, not symlinks** — the new project is standalone and won't have access to Alfred OS's directory structure.

   If nothing seems relevant, skip this step. Don't force it.

6. **Set up .mcp.json** if relevant tools have MCP servers:
   ```json
   {
     "mcpServers": {
       "shadcn": { "command": "npx", "args": ["shadcn@latest", "mcp"] }
     }
   }
   ```

7. **Add LLMs.txt references to CLAUDE.md** — list authoritative doc URLs for every major dependency so future AI sessions use accurate, version-specific docs instead of stale training data:
   ```markdown
   ## LLMs.txt
   - Next.js: https://nextjs.org/docs/llms.txt
   - Tailwind CSS: https://tailwindcss.com/docs/styling-with-utility-classes
   - shadcn/ui: https://ui.shadcn.com/llms.txt
   - Base UI: https://base-ui.com/llms.txt
   ```
   Search `"[library-name] llms.txt"` for each dependency in the stack. Not every library publishes one, but many major ones do. For Next.js projects specifically, `npx @next/codemod agents-md --output CLAUDE.md` auto-generates a local docs index.

8. **Commit and push**:
   ```bash
   chmod +x .claude/hooks/*.sh
   git add .
   git commit -m "Initial commit: [project] bootstrap"
   git push -u origin main
   ```

## Examples

### "Help me track my expenses"
**Triage:** Repeatable workflow → **Skill only**
**Creates:** `.claude/skills/tracking-expenses/SKILL.md`

### "I want to start a podcast"
**Triage:** Artifacts needed, no special domain → **Folder + Skill**
**Creates:**
- `2-projects/podcast/` with episodes/, guests/, scripts/
- `.claude/skills/managing-podcast/SKILL.md`

### "I want to learn Rust"
**Triage:** Extended learning journey → **Separate project**
**Creates:** `~/Projects/rust-learning/` with CLAUDE.md containing Rust knowledge

### "Build me a habit tracking app"
**Triage:** Building software → needs complex interactions (check/uncheck habits, streaks, history) → **Software repo**
**Creates:** `~/Projects/habit-tracker/` with software-project template + GitHub repo (docs/, scripts/, no PARA folders)

### "I want a daily news digest on my dashboard"
**Triage:** Building software → but it's read-only data display that updates daily → **Orbit widget**
**Creates:** `widgets/news-digest/` folder in Orbit repo with `_widget.json`, cron script to fetch news, markdown template

### "Show me my portfolio balance every morning"
**Triage:** Building software → read-only finance data, updates on schedule → **Orbit widget**
**Creates:** `widgets/finance/` folder in Orbit repo with `_widget.json`, script to fetch portfolio data, generates markdown with tables

### "Help me use Obsidian better"
**Triage:** Workflow with domain knowledge that fits in a skill → **Skill only**
**Creates:** `.claude/skills/working-with-obsidian/SKILL.md` (with Obsidian knowledge baked in)

### "I want to write a book"
**Triage:** Artifacts needed, Alfred knows how to write → **Folder + Skill**
**Creates:**
- `2-projects/my-book/` with chapters/, research/, drafts/
- `.claude/skills/managing-book/SKILL.md`

## Quality Markers

- Container type confirmed with user before proceeding
- Skill-only routes hand off cleanly to creating-skills
- Folder structures match the initiative's actual needs
- Managing skills define workflows, not just list files
- Separate projects have customized CLAUDE.md (not generic)
- Software projects are on GitHub
- Software stacks were researched (not just recalled from training data)
- CLAUDE.md includes links to AI docs (llms.txt, MCP configs) for the chosen stack
- Orbit widget was considered before defaulting to full software project

## Anti-Patterns

- Creating a full project for a simple workflow
- Skipping triage and defaulting to project creation
- Creating managing skills that just say "this folder has files"
- Putting CLAUDE.md in folders that don't need dedicated context
- Not confirming container type with user before building
- Building a full app when an Orbit widget would suffice
- Recommending tech stacks from memory without checking current best practices
- Picking "cool" or "cutting-edge" tech over AI-friendly tech that ships faster

## Process Checklist

```
[ ] Triage: Determined container type
[ ] Confirmed: User agreed with container choice
[ ] Created: Appropriate container built
[ ] Verified: Everything works as expected
```
