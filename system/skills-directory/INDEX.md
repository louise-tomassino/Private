# Skills Directory Index

This directory contains the **optional skills catalog** — skills that users can browse and install on demand.

Core skills live directly in `.claude/skills/` as real directories. Optional skills live here and get symlinked into `.claude/skills/` when installed.

## Architecture

```
.claude/skills/                    ← What Claude sees (active skills)
  avoiding-duplicates/             ← Core (real directory)
  creating-skills/                 ← Core (real directory)
  installing-skills/               ← Core (real directory)
  onboarding/                      ← Core (real directory)
  processing-inbox/                ← Core (real directory)
  reviewing-skills/                ← Core (real directory)
  starting-new-things/             ← Core (real directory)
  troubleshooting/                 ← Core (real directory)
  whats-possible/                  ← Core (real directory)
  prepping-meetings -> ...         ← Optional (symlink, if installed)

system/skills-directory/           ← Optional skills catalog
  productivity/
    prepping-meetings/
    time-audit/
    working-with-notion/
  business/
    business-lead-research/
  communication/
    reviewing-presentations/
  building/
    frontend-design/
```

## How Installation Works

Users say "Install [skill-name]" or "What skills are available?" and the `installing-skills` core skill handles it:

1. Finds the skill in this directory
2. Creates a symlink: `.claude/skills/[skill] → ../../system/skills-directory/[category]/[skill]`
3. Skill is immediately available

Removal works the same way in reverse — delete the symlink.

## Where Skills Are Referenced

### Alfred OS (`.claude/skills/`)

9 core skills as real directories (always present):
- avoiding-duplicates, creating-skills, installing-skills, onboarding, processing-inbox, reviewing-skills, starting-new-things, troubleshooting, whats-possible

### Project Templates (`system/templates/`)

Two templates exist:
- `software-project/` — For deployable software (flat structure, `docs/` instead of PARA)
- `project/` — For non-software separate projects (PARA four-folder pattern)

Both include a minimal skill set:

| Skill | Type |
|-------|------|
| `prd` | Real directory (project-specific PRD generation) |

### Pennyworth (via submodule symlinks)

Business workspace links through the `alfred-os-template/` submodule:

| Symlink | Points to |
|---------|-----------|
| `creating-skills` | `.claude/skills/creating-skills` |
| `avoiding-duplicates` | `.claude/skills/avoiding-duplicates` |
| `frontend-design` | `system/skills-directory/building/frontend-design` |
| `reviewing-presentations` | `system/skills-directory/communication/reviewing-presentations` |
| `working-with-notion` | `system/skills-directory/productivity/working-with-notion` |

Plus Pennyworth-only skills (not in this directory):
- `processing-transcripts` — Business-internal transcript processing
- `vetting-for-directory` — Full vetting pipeline with security scan and hash recording

## Adding a New Skill

1. Create the skill folder in the right category here: `system/skills-directory/[category]/[skill-name]/SKILL.md`
2. If it's a core skill, place it directly in `.claude/skills/` instead
3. If Pennyworth needs it, add a symlink through the submodule path
4. Run the vetting process before considering it ready
5. Update `catalog.md` with the new entry
