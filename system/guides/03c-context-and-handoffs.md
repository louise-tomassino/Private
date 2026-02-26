# Context Management

How Claude remembers things and how context is preserved across conversations.

---

## The Key Concept

**Each conversation starts fresh.**

When you open a new chat, Claude doesn't remember your previous conversations. But Alfred OS has an automatic memory system that bridges this gap:

1. **CLAUDE.md** is read at conversation start (your identity and preferences)
2. **Memory files** are loaded automatically (recent daily logs + long-term memory)
3. **Stored memories** persist across all projects (Claude's built-in memory feature)

This means Claude starts each session with a strong foundation of who you are, what you've been working on recently, and what it's learned about you over time — all without you doing anything.

---

## The Mental Shift: Files, Not Conversations

If you're coming from ChatGPT, you're probably used to scrolling back through old conversations to find context. "Where was that discussion about our marketing strategy?"

**That mental model doesn't work here.**

In Claude Code, conversations are disposable. They're working sessions, not storage. Your knowledge lives in **files**, not conversation history.

### The new question

- **Old thinking:** "Which conversation had that?"
- **New thinking:** "Which file has that?"

### Where knowledge lives

| Type of Output | Example | Where It Goes |
|----------------|---------|---------------|
| Quick observation | "User prefers concise emails" | Daily memory log (automatic) |
| Stable pattern | "Always checks calendar before email" | Long-term memory (automatic) |
| Evolving framework | "My investment strategy" | Living document (`investment-framework.md`) |
| Final decision | "We're going with Option B" | Finalized document (`decisions/pricing-model.md`) |
| Process you'll repeat | "How I onboard clients" | Skill or reference doc |

### Why this is better

1. **Files are searchable** - Grep through your docs folder, not your memory
2. **Files are shareable** - Hand someone a document, not a conversation transcript
3. **Files compound** - Your `investment-framework.md` gets better over time
4. **Conversations stay fast** - No bloated context from previous topics
5. **Memory is automatic** - Alfred captures important learnings without you asking

**Conversations are for working. Files are for knowing.**

---

## How Alfred Remembers

### 1. CLAUDE.md (Project Context)

Read automatically at the start of every conversation in that folder.

**Best for:** Permanent preferences, identity, system configuration

```markdown
## Who I Am
Sarah Chen, marketing director...

## Preferences
- Be concise
- Always verify changes work
```

**When to update:** When something should be true for ALL future conversations.

---

### 2. Automatic Memory System

Alfred maintains a memory system in `system/memory/` that works without any action from you.

**Daily logs** (`system/memory/daily/YYYY-MM-DD.md`):
- Alfred writes observations throughout the day — preferences, decisions, workflow patterns
- Today's and yesterday's logs are loaded automatically at session start
- You can read them anytime to see what Alfred has learned

**Long-term memory** (`system/memory/MEMORY.md`):
- Curated, stable knowledge proven across multiple sessions
- Loaded at the start of every session
- Updated automatically when patterns emerge

**What makes this work:**
- A `SessionStart` hook loads memory at the start of every conversation
- A `PreCompact` hook saves important context before the conversation gets compressed
- This means even very long conversations don't lose context

**You don't need to do anything.** Alfred reads, writes, and manages memory files automatically.

---

### 3. The Memory Feature

Claude can store memories that persist across all projects.

**To add:**
```
Remember that I prefer dark mode in all applications
```

**To check:**
```
What do you remember about me?
```

**Best for:** Personal preferences that apply everywhere, not just one project.

---

## The @ Mention Feature

You can bring files and context into a conversation using `@`:

### @file

Reference a specific file:
```
Look at @src/components/Button.tsx and fix the styling
```

### @folder/

Reference an entire folder:
```
Review @src/api/ for security issues
```

### @ picker

In Claude Desktop and Cursor, typing `@` opens a picker to search for files.

### Why Use @

- Explicitly tells Claude which files matter
- Brings file content into context immediately
- Useful when Claude needs to see something specific

---

## Context Management Tips

### Signs Your Context is Getting Bloated

- Claude seems slower to respond
- Claude forgets things from earlier in the conversation
- Responses feel less focused

**Fix:** Start a fresh conversation. Alfred's memory system automatically preserves important context, so you can clear freely.

### Keep CLAUDE.md Focused

Don't dump everything into CLAUDE.md. It's read every conversation - keep it to:
- Identity and role
- Key preferences
- System configuration
- Active project state (updated as needed)

Detailed documentation belongs in `docs/` files that Claude can read when relevant.

### Name Things Clearly

When you create files, tasks, or projects, use descriptive names. Claude will encounter them with fresh context later - "project-x" tells it nothing, "marketing-website-redesign" tells it everything.

---

## Example Workflow

**Monday:**
1. Start conversation, work on feature
2. Take a break — just close the conversation when done
3. Start a new conversation after lunch — Alfred loads your memory and picks up context

**Tuesday:**
1. New conversation — Alfred already knows what you worked on yesterday
2. Continue work
3. Feature complete

**Two Weeks Later:**
1. "What was the decision on X?"
2. Claude searches daily logs or reads relevant documents for historical context

---

*Next: Understand when to create new repos in `system/guides/05b-repository-strategy.md`*
