# Official Claude Skill Best Practices

*Summary from [platform.claude.com](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)*

## Core Principles

### 1. Conciseness is Key

The context window is a public good. Claude is already smart.

Challenge each piece:
- "Does Claude really need this?"
- "Can I assume Claude knows this?"
- "Does this justify its token cost?"

### 2. Progressive Disclosure

Three loading levels:
1. **Metadata** (~100 tokens): Name + description, always loaded
2. **SKILL.md body** (<5k tokens): Loaded when triggered
3. **References**: On-demand only, zero cost until accessed

### 3. Degrees of Freedom

| Level | When to Use |
|-------|-------------|
| **High** (text) | Multiple valid approaches |
| **Medium** (pseudocode) | Preferred pattern, some variation OK |
| **Low** (scripts) | Fragile operations, consistency critical |

## Structure

```
skill-name/
├── SKILL.md (required, <500 lines)
├── references/ (optional)
│   ├── guide.md
│   └── examples.md
└── scripts/ (optional)
    └── helper.py
```

Keep references **one level deep** - Claude may partially read deeply nested files.

## Description Best Practices

### Always Third Person

```yaml
# Good
description: "Extracts patterns from content"

# Bad
description: "I can help you extract patterns"
```

### Include Trigger Keywords

```yaml
# Good
description: "Extract patterns. Use when: extraction, analyze, identify."

# Bad
description: "Helps with stuff"
```

## Anti-Patterns

1. **Vague descriptions** - No trigger keywords
2. **Too verbose** - Explaining what Claude knows
3. **Deeply nested references** - Keep to one level
4. **Too many options** - Provide a default
5. **Inconsistent terminology** - Pick one term, use it everywhere

## Sources

- [Skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [Agent Skills Overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- [Claude Code Skills](https://code.claude.com/docs/en/skills)
