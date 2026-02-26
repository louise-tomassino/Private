---
name: working-with-notion
description: "Add and manage content in Notion. Use when: add to Notion, update Notion, create Notion page, Notion document."
---

# Working with Notion

## Core Principle

Always ask before acting. Confirm location, confirm changes, never delete without permission.

## When to Use

- "Add this to Notion"
- "Update the Notion doc"
- "Create a page in Notion"
- "Include this in Notion"

## Formatting Rules

Use only these block types:

| Element | Block Type | Example |
|---------|------------|---------|
| Section headers | `heading_2` | "1. Executive Summary" |
| Sub-headings | `heading_3` | Or paragraph as label |
| Regular text | `paragraph` | Body content |
| Lists | `bulleted_list_item` | Details, options, items |

**Section headers**: Always numbered (1. Title, 2. Title, etc.)

**Sub-headings**: Use `heading_3` or a paragraph label followed by text/bullets - choose based on context.

**Emphasis**: Write normally. No ALL CAPS for emphasis (API doesn't support bold).

**Detail formatting**: Choose what's clearest for the situation:
- Option A: Each detail as separate bullet
- Option B: Combined into one bullet with dashes

## Page Management

### Before Adding Content

Always ask:
1. Should this go in an existing page? If so, which one?
2. Or should I create a new page? If so, where in the structure?

User's workspaces: Ventures, Alfred, private pages

### Creating New Pages

If page creation fails (API bug with parent parameter):
1. Tell the user it failed
2. Ask them to create the page manually in Notion
3. Once created, add the content

### New Document Types

When creating a new document, ask:
- "Will you have more documents of this type?"
- "Should we create a template first to add to the skill?"

## Modifying Content

### Adding New Sections

Ask where to place them - don't assume end of document.

### Updating Existing Content

1. Try to find the existing blocks
2. Confirm with user before modifying
3. Then make changes

### Deleting Content

Never delete without asking first. Always get explicit permission.

## Searching for Pages

Use keywords when searching, not exact titles.

## API Limitations

Things the Notion API cannot do:
- Bold/italic text within paragraphs
- Tables
- Toggles
- Numbered lists
- Create subpages reliably (parent parameter bug)

Workaround for subpages: Append blocks to existing page, or ask user to create page manually.

## Process Summary

1. User asks to add/update Notion content
2. Ask: existing page or new page? Where?
3. If new document type: ask about template
4. If new page creation fails: ask user to create manually
5. If updating: find blocks, confirm changes
6. If deleting: ask permission first
7. Add content using heading_2, heading_3, paragraph, bulleted_list_item
8. Use numbered section headers

## Anti-Patterns

- Adding content without asking where
- Deleting or modifying without confirmation
- Using ALL CAPS for emphasis
- Assuming page location
- Creating pages without asking about templates for recurring types
