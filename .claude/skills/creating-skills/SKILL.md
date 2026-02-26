---
name: creating-skills
description: "Create custom Claude Code skills. Use when: create skill, new skill, add capability, automate workflow."
---

# Creating Skills

## Core Principle

Skills are markdown guides that teach Claude specialized capabilities. Claude is already smart - only add context it doesn't have.

## When to Use This Skill

- "Create a skill for X"
- "Add a capability for Y"
- "Automate this workflow"
- "Make a command for Z"

## Skill vs Slash Command

| Type | Location | Invocation | Best For |
|------|----------|------------|----------|
| **Skill** | `.claude/skills/skill-name/SKILL.md` | Natural language (Claude decides) | Complex workflows, multi-step processes |
| **Slash Command** | `.claude/commands/command-name.md` | Explicit `/command-name` | Simple actions, one-shot tasks |

**Rule of thumb**: If it's a workflow with decisions -> Skill. If it's a direct action -> Slash Command.

## Quick Start

### 1. Create Directory

```bash
mkdir -p .claude/skills/{skill-name}
```

**Naming**: Use gerund form (verb + -ing): `processing-inbox`, `managing-tasks`, `drafting-emails`

### 2. Create SKILL.md

```markdown
---
name: skill-name
description: "What it does. Use when: trigger1, trigger2, trigger3."
---

# Skill Title

## Core Principle
One sentence capturing the essence.

## When to Use
- Trigger phrase 1
- Trigger phrase 2

## Process
1. Step one
2. Step two
3. Step three

## Quality Markers
- What good output looks like

## Anti-Patterns
- What to avoid
```

### 3. Add References (Optional)

For complex skills, use progressive disclosure:

```
skill-name/
├── SKILL.md          # Overview (<500 lines)
└── references/
    ├── examples.md   # Detailed examples
    └── guide.md      # Extended documentation
```

## Critical Requirements

### Description Format

**Must be single-line with trigger keywords:**

```yaml
# CORRECT
description: "Process flagged emails into responses and digests. Use when: process inbox, email triage, inbox zero."

# WRONG - breaks discovery
description: |
  Multi-line description
  breaks skill discovery
```

### Directory Matches Name

```
skills/creating-skills/SKILL.md -> name: creating-skills  ✓
skills/skill-creator/SKILL.md -> name: creating-skills    ✗
```

### Token Budget

| Level | Budget | When Loaded |
|-------|--------|-------------|
| Metadata | ~100 tokens | Always (discovery) |
| SKILL.md body | <5k tokens | When skill triggers |
| References | Unlimited | On-demand only |

**Keep SKILL.md under 500 lines.** References have zero cost until accessed.

## Process

1. **Identify the gap**: What can't Claude do well without this skill?
2. **Choose type**: Skill (workflow) or Slash Command (action)?
3. **Create structure**: Directory + SKILL.md with frontmatter
4. **Write the core**: Principle, triggers, process
5. **Add guardrails**: Quality markers, anti-patterns
6. **Test**: Run a real scenario, iterate

## Quality Markers

- Description includes trigger keywords
- Process is step-by-step, not prose
- Under 500 lines
- Self-contained (no external dependencies assumed)

## Anti-Patterns

### Vague Descriptions

```yaml
# Bad
description: "Helps with email stuff"

# Good
description: "Process flagged emails into responses and digests. Use when: process inbox, email triage."
```

### Too Verbose

Claude knows most things. Only explain what's unique to your workflow.

```markdown
# Bad
"Email is a form of electronic communication that..."

# Good
"Search `is:starred` in both accounts, categorize by response needed vs read later."
```

### Over-Engineering

If your skill has >10 sections, it's probably doing too much. Split it.

## References

- [Official Best Practices](references/official-best-practices.md)
- [Example Skills](references/examples.md)

## Meta-Principle

Every skill should answer: "What does Claude need to know that it doesn't already know?" If you can't answer that, the skill is unnecessary.
