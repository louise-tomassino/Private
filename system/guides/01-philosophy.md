# Philosophy: Working WITH AI

These are the mindset shifts that separate people who struggle with AI from people who fly with it.

---

## 1. Your Most Important Job: Building Your Agent

Here's the shift: You have two jobs now.

**Job 1:** Do the work (write emails, organize files, plan trips, whatever)
**Job 2:** Teach Claude to do the work better next time

Most people only do Job 1. They use Claude like a tool - ask, get answer, move on. But the magic happens when you invest in Job 2.

### What "building your agent" means:

- Every time you correct Claude → add that correction to CLAUDE.md
- Every time you explain how you like things → write it down permanently
- Every workflow you repeat → turn it into a skill
- Every preference you have → make it explicit

### The compounding effect:

- Week 1: Claude needs lots of guidance
- Week 4: Claude knows your style, your preferences, your systems
- Week 12: Claude feels like it reads your mind

This is "Compounding Engineering" - a framework from Dan Shipper at Every. The idea: each task should make the next task easier.

> "Instead of doing the work, you do the thing that does the work going forward."

### Non-technical examples:

| You notice... | You add to CLAUDE.md... |
|---------------|-------------------------|
| Claude writes emails too formally | "Write emails in a casual, friendly tone" |
| Claude forgets your family members | Add them to "Who I Am" section |
| Claude puts tasks in wrong category | Clarify the rules for each category |
| Claude formats lists wrong | "Always use checkbox format: - [ ]" |
| Claude asks questions you've answered before | Add the answer permanently |

### The habit:

After every session, ask yourself: "What did I have to correct? How do I prevent that forever?"

### Real results:

Teams using this approach report 5-10x productivity gains within weeks. Not because Claude got smarter - because their instructions got better.

---

## 2. Letting Go and Trusting the Output

This is hard for control-oriented people. But it's essential.

### The old mindset:
- Review everything Claude produces
- Double-check every detail
- Edit extensively before using
- Stay in control

### The new mindset:
- Describe what you want clearly
- Let Claude work
- Check if the outcome is right
- Move on

**The key question:** Did it do what I asked? If yes → done. Don't nitpick.

### Why this matters:

If you review everything in detail, you lose all the speed benefits. You might as well have done it yourself. The whole point is to delegate and trust.

### The speed tradeoff:
- Will Claude sometimes get things wrong? Yes.
- Is the overall speed gain worth occasional mistakes? Absolutely.
- Can you fix mistakes quickly? Usually faster than doing it yourself from scratch.

### When to review carefully:
- Emails to important people (boss, clients, investors)
- Financial decisions
- Anything you can't easily undo
- Public-facing content

### When to trust and go:
- Internal notes and documents
- First drafts you'll iterate on
- Task organization
- Research and summaries
- Anything low-stakes

**The mental shift:** Think of Claude as a capable assistant, not a tool you operate. You don't micromanage a good assistant - you trust them and course-correct when needed.

---

## 3. Aiming for First-Run Success

The goal isn't "Claude + lots of back-and-forth." The goal is "Claude gets it right the first time."

### What makes Claude reliable:
- Clear CLAUDE.md with who you are and how you work
- Examples of what "good" looks like for you
- Explicit preferences (tone, format, structure)
- Context about your life, work, and systems

### The investment pays off:
- 30 minutes writing good instructions → saves hours of corrections
- Adding one preference → prevents dozens of future fixes
- Creating one skill → automates a workflow forever

### Signs your system is working:
- You give a task, come back to exactly what you wanted
- Claude "just knows" how you like things
- You rarely have to correct or redo
- It feels like Claude reads your mind

### Signs your system needs work:
- Same mistakes keep happening
- You're constantly explaining things you've explained before
- Every task requires heavy guidance
- You feel like you're fighting the tool

**The fix:** When something goes wrong, don't just fix it once. Ask: *"How do I prevent this forever?"* Then update CLAUDE.md or create a skill.

---

## 4. Context is Everything

LLMs need context. The more context you give, the better the output.

But here's the problem: **typing is slow, and when typing is slow, you get lazy.** You leave out details. You simplify. You don't bother explaining the full picture.

### The solution: Voice

When you talk, you naturally ramble. You add "oh, and also..." and "the reason I want this is..." and all the context that makes Claude actually understand what you need.

**The difference:**
- **Typing:** "Make me a dashboard"
- **Talking:** "Make me a dashboard, I want to see my tasks for today, maybe the weather, I'm in Stockholm so use that location, and actually I'd love to see my calendar too, and keep it simple, I don't want anything fancy, just clean and readable"

Same intent. Wildly different results.

See `system/guides/03-wispr-flow-guide.md` for voice dictation setup.

---

## 5. Why Local Files Beat Cloud Tools

You might wonder: why use local files and GitHub instead of Notion, Google Drive, or other cloud tools?

**Speed.**

When your files are local on your computer:
- Claude reads them directly - instant access
- No API calls, no waiting for external services
- Search across thousands of files in milliseconds

When you use cloud tools (even with MCP connections):
- Every read requires an API call
- Network latency adds up
- Rate limits can slow you down
- More things that can break

### GitHub Issues vs Notion

Same principle applies to task management:
- GitHub Issues via CLI: Claude runs a command, gets results instantly
- Notion via MCP: API call, wait for response, parse results

The difference might be seconds per operation. But those seconds compound across hundreds of daily interactions.

### The tradeoff

Cloud tools have advantages: collaboration, mobile access, prettier interfaces. But for your personal AI system, local-first wins on speed.

**Rule of thumb:** If Claude needs to access it frequently, keep it local.

---

## 6. One Task, One Conversation

**Always clear the conversation when starting a new task.**

This is different from ChatGPT, where you might keep chatting in the same thread. Here, leftover context from previous tasks causes problems:
- Claude might reference outdated information
- Context gets bloated and responses slow down
- Easier to get confused about what you're working on

### The habit

- Finished a task? Clear and start fresh.
- Switching topics? Clear and start fresh.
- Something feels off? Clear and start fresh.

New conversations are free. Debugging context pollution is expensive.

Alfred's memory system automatically preserves important context, so you can clear freely.

---

## 7. Invite Claude to Think With You

Most people use AI like a vending machine: put in a request, get a result. But the best results come from **collaboration**, not commands.

### The shift:

- **Old approach:** "Write me an email to [client]" → Claude writes, you send
- **New approach:** "I need to email [client] about [situation]. What do you think is the best angle?" → Claude suggests, you discuss, then Claude writes

### What this looks like in practice:

| Instead of... | Try... |
|---------------|--------|
| "Make me a plan" | "What do you think the best approach is?" |
| "Write this document" | "Here's what I'm thinking. What am I missing?" |
| "Research this topic" | "I'm trying to decide X. What should I consider?" |
| "Create tasks for this project" | "Help me think through what needs to happen" |

### Why this matters:

Claude has real intelligence. When you only give instructions, you get execution. When you invite ideas, you get:

- **Perspectives you didn't consider.** Claude has broad knowledge and can spot blind spots.
- **Better quality.** When Claude understands the "why" behind a request, it makes smarter decisions about the "how."
- **Surprises.** Sometimes Claude suggests something you never thought of — and it's better than your original idea.

### The two-way relationship:

Building your agent (Principle 1) is about teaching Claude. This principle is about **letting Claude teach you**.

- Correct Claude when it's wrong → it learns your preferences
- Ask Claude for suggestions → you learn new approaches
- Challenge Claude's ideas → you both arrive at better answers

### How to build this habit:

Add phrases like these to your vocabulary:
- "What do you think?"
- "How would you approach this?"
- "What am I not thinking about?"
- "Push back if you disagree with my approach"
- "Suggest improvements — don't just do what I say"

You can even add this to your CLAUDE.md preferences:
```
- Proactive suggestions welcome - if you notice something I'm missing, speak up
- Push back when you think there's a better approach
- Ask clarifying questions rather than making assumptions
```

> **The mindset:** Claude isn't just your assistant — it's your thinking partner. The best sessions feel like a conversation, not a to-do list.

---

## Summary

1. **Build your agent** - Every correction becomes a permanent improvement
2. **Let go** - Trust the output, don't micromanage
3. **Aim for first-run** - Invest in instructions that make Claude reliable
4. **Give context** - Use voice to naturally provide more detail
5. **Stay local** - Local files and Git are faster than cloud tools
6. **Clear often** - One task, one conversation
7. **Invite Claude to think** - Collaborate, don't just command

This is the game: Building a system where Claude delivers reliably on the first try, AND where your collaboration with Claude makes both of you better. When you achieve this, you can finally delegate with confidence and focus on higher-level thinking.

---

*Next: Set up voice dictation in `system/guides/03-wispr-flow-guide.md`*
