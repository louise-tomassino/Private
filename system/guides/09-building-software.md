# Building Software with Claude Code

A guide for building apps, tools, and websites - even if you've never coded before.

---

## The Mental Shift

**You are the product manager. Claude is the developer.**

Your job:
- Describe what you want
- Test if it works
- Give feedback when it doesn't

Claude's job:
- Figure out how to build it
- Write the code
- Fix problems

You don't need to understand the code. You need to clearly describe what you want and verify it works.

---

## Starting a Project

### Create the Repo

Say:
```
Create a new project for [what you're building]
```

Claude interviews you about your goals, researches the domain, and creates a repo with:
- CLAUDE.md populated with domain knowledge
- Structure for development (PRD, plans, docs)
- Scripts for autonomous execution

### Your First Conversation

Open a conversation from your new project folder. Claude now has that project's CLAUDE.md context.

Start with the simplest version:
```
"Let's start with the most basic version - just [core feature].
What's the simplest way to build this?"
```

Let Claude suggest the tech stack. Don't worry about understanding it - you can always ask "explain that in simple terms."

---

## Three Ways to Build

### 1. Conversational (Back and Forth)

**Best for:** Learning, exploration, small features, when you're not sure what you want

**How it works:**
```
You: "Add a button that saves the form"
Claude: [writes code, explains what it did]
You: "Make it blue and put it on the right side"
Claude: [updates code]
You: "What if someone clicks it twice?"
Claude: [adds protection, explains]
```

**Tips:**
- Ask questions as you go
- Say "show me" to see the result
- Say "explain what that does" when confused

---

### 2. Plan Mode

**Best for:** Features that touch multiple files, when you want to review before changes

**How it works:**
1. Claude enters plan mode (read-only exploration)
2. Claude writes a plan with steps
3. You review and approve (or give feedback)
4. Claude executes the plan

**Triggered by:**
- Complex requests
- Claude being uncertain
- You saying "plan this first"

**During plan mode:**
- Claude can only read, not write
- You'll see a "Plan Mode" indicator
- Approve to proceed, or give feedback to revise

---

### 3. Ralph Loop (Autonomous)

**Best for:** Well-defined multi-task projects, when you can walk away

**How it works:**
1. Create a PRD with checkbox tasks (`/prd` or "break this into tasks")
2. Run `./scripts/ralph.sh`
3. Claude works through tasks one by one, fresh context each iteration
4. Progress tracked in `progress.md`

**Example PRD:**
```markdown
## Tasks

### Task 1: Set up project structure
- [ ] Create Next.js app
- [ ] Add Tailwind CSS
- [ ] Create basic layout component

### Task 2: Build login page
- [ ] Create login form component
- [ ] Add email/password fields
- [ ] Connect to auth API
```

**When to use:**
- You have clear requirements
- Tasks are well-defined
- You want to step away and let Claude work

**When NOT to use:**
- Requirements are fuzzy
- Needs architectural decisions
- Security-critical code (review manually)

---

## Automated Test Loops

The most powerful way to build: **let Claude see and verify its own work.**

### Why This Matters

Without feedback, Claude is coding blind. With automated testing, Claude can:
- See what it built (screenshots, browser state)
- Verify features work
- Catch and fix bugs immediately
- Iterate until it's right

### Option 1: Browser MCP (Claude Sees the Browser)

Install the Browser MCP to let Claude control and see a real browser.

**What it enables:**
- Claude can open your app
- Take screenshots of what it built
- Click buttons, fill forms, navigate
- Verify the UI looks and works correctly

**Workflow:**
```
You: "Add a signup form"
Claude: [writes code]
Claude: [opens browser, takes screenshot]
Claude: "Here's what it looks like. The form renders but the
        submit button is misaligned. Let me fix that..."
Claude: [fixes code, takes new screenshot]
Claude: "Fixed. The form now looks correct and submits properly."
```

### Option 2: Playwright MCP (Automated Browser Testing)

Playwright is a browser automation tool. With the Playwright MCP, Claude can write and run automated tests.

**What it enables:**
- Write tests that verify features work
- Run tests automatically after changes
- Catch regressions before you see them
- Build a test suite that grows with your app

**Workflow:**
```
You: "Add a delete button to each task"
Claude: [writes the feature]
Claude: [writes Playwright test: click delete, verify task disappears]
Claude: [runs test]
Claude: "Test passed. Delete button works correctly."
```

### Option 3: Dev Server + Screenshots

Even without MCPs, Claude can:
1. Start a dev server (`npm run dev`)
2. Use built-in screenshot tools to capture the page
3. Analyze what it sees

**Basic workflow:**
```
You: "Build this and show me what it looks like"
Claude: [writes code, starts server, takes screenshot]
Claude: "Here's the current state. I notice the header is
        overlapping the content. Let me fix that..."
```

### Setting Up Test Loops

**For Browser MCP:**
```
npx @anthropic-ai/claude-mcp@latest install-mcp @anthropic-ai/mcp-browser
```

**For Playwright MCP:**
```
npx @anthropic-ai/claude-mcp@latest install-mcp @anthropic-ai/mcp-playwright
```

**Best practice:** Tell Claude in your CLAUDE.md:
```markdown
## Development Workflow

After making UI changes:
1. Start the dev server if not running
2. Take a screenshot to verify the change
3. Fix any visual issues before moving on

For features that can be tested:
1. Write a Playwright test
2. Run the test
3. Only mark complete if test passes
```

---

## Working Iteratively

### Start With the Smallest Thing

Don't describe the full app. Start with:
```
"Let's just get a page that shows 'Hello World' first"
```

Then build up:
```
"Now add a text input"
"Now save what I type to a list"
"Now persist the list when I refresh"
```

### Test Before Adding More

After each change:
```
"Does this work? Let me test it"
```

Or if you have test loops set up:
```
"Verify this works before continuing"
```

### One Feature at a Time

Resist the urge to describe everything at once. Sequential beats parallel:
1. Build feature A
2. Verify it works
3. Build feature B
4. Verify it works

---

## Reviewing Claude's Work

### "Show Me"

After Claude makes changes:
```
"Show me what this looks like now"
"Run it and show me the output"
"Take a screenshot"
```

### Manual Testing

Even with automation, manually test:
- Click around, try edge cases
- What happens with empty input?
- What happens if you click twice?
- Does it work on mobile? (resize browser)

### "Explain What You Did"

When you want to understand:
```
"Explain what this code does in simple terms"
"Why did you do it this way?"
"What would break if we changed X?"
```

You don't need to understand everything, but understanding the big picture helps you make better requests.

### Code Review for Non-Coders

You can review without understanding code:
```
"Is this code secure?"
"Are there any obvious bugs?"
"What could go wrong with this approach?"
"Is this the simplest way to do this?"
```

Claude will audit its own work and flag concerns.

---

## When Things Break

### Error Messages Are Gold

When something breaks, copy the entire error message and paste it to Claude:
```
"I got this error: [paste error]"
```

Error messages tell Claude exactly what went wrong.

### Screenshots Help

For visual bugs:
1. Take a screenshot
2. Describe what's wrong: "The button should be on the right but it's on the left"

### "Undo That"

If Claude made a change that broke things:
```
"Undo that last change"
"Revert to before you touched the login page"
```

Git tracks all changes - Claude can undo.

### Starting Fresh

If things are truly broken:
```
"Let's start over on this feature. Revert everything
you did today and let's try a different approach."
```

---

## Documenting Solutions

### Why Document

Future-you (and future-Claude) will encounter the same problems. Documentation compounds.

### When to Document

- Bug took more than 10 minutes to figure out
- Non-obvious configuration or setup
- Workaround for a library quirk
- Anything where you thought "I'll forget this"

### Where

Create `docs/solutions/problem-name.md`:

```markdown
# Button Click Not Working on Mobile

**Symptoms:** Button works on desktop but not on mobile/touch devices

**Root Cause:** CSS hover state was preventing touch events from registering

**Solution:** Added `touch-action: manipulation` to button styles

**Prevention:** Always test touch interactions, not just click
```

### Tell Claude to Document

```
"Document this solution in docs/solutions/"
"That was tricky - write it up so we don't forget"
```

---

## Tips for Non-Technical Builders

### Ask "Dumb" Questions

There are no dumb questions. Ask:
- "What does that mean?"
- "Explain it like I'm five"
- "What's a [technical term]?"

Claude will explain without judgment.

### "Is There a Simpler Way?"

If something feels complicated:
```
"This seems complex. Is there a simpler approach?"
"What's the easiest way to do this, even if it's not perfect?"
```

Often there's a simpler solution.

### Say What You See, Not What You Think Is Wrong

**Instead of:** "The CSS is broken"
**Say:** "The button is showing up below the form instead of next to it"

Describe the symptom. Let Claude diagnose the cause.

### Screenshots > Descriptions

A screenshot tells Claude exactly what you're seeing. Take lots of them.

### It's Okay to Not Understand

You don't need to understand every line of code. Focus on:
- Does it work?
- Does it do what I wanted?
- Is it fast enough?

The code is Claude's domain. The product is yours.

### Learn as You Go

You'll naturally pick up concepts over time. Don't try to learn everything upfront. Build things, ask questions, absorb gradually.

---

## Example Session

```
You: "Create a new project for a personal finance tracker"

[Claude creates repo, interviews you about features]

You: "Let's start simple - just a page where I can add expenses
     with a name and amount"

Claude: [creates basic app with form]
Claude: [takes screenshot]
Claude: "Here's the basic expense form. You can enter a name
        and amount. Want me to add the ability to see past expenses?"

You: "Yes, show them in a list below the form"

Claude: [adds expense list]
Claude: [takes screenshot, runs test]
Claude: "Done. Expenses now appear in a list. The test verifies
        adding and displaying works. What's next?"

You: "The amounts should show as currency, like $50.00"

Claude: [updates formatting]
Claude: [screenshot showing $50.00 format]
Claude: "Updated. Amounts now display as currency."

You: "Perfect. Now let's add categories..."
```

---

## Next Steps

1. **Create your first project:** "Create a new project for [your idea]"
2. **Start small:** Build the simplest possible version
3. **Set up test loops:** Install Browser or Playwright MCP
4. **Iterate:** Add features one at a time, verify each works
5. **Document:** When you solve tricky problems, write them down

---

*You're not learning to code. You're learning to direct an AI that codes. That's a different - and valuable - skill.*
