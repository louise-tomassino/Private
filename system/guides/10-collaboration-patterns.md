# Collaboration Patterns

How to work with others when everyone has an AI agent.

**Level:** Advanced

---

## The Shift

Traditional collaboration assumes humans talk directly to humans. Agent-mediated collaboration assumes humans work through agents, and agents communicate with each other via shared artifacts.

```
Traditional:    Human A  ←→  Human B

Agent-mediated: Human A  →  Agent A  →  [Artifact]  →  Agent B  →  Human B
```

This changes everything about how you document, hand off, and collaborate.

---

## Files vs Issues: When to Use Each

You have two main places to capture work: **files** (markdown documents) and **issues** (GitHub Issues). Choosing wrong creates friction.

### Use Files When:

The deliverable **IS** the file.

| Example | Why It's a File |
|---------|-----------------|
| Investment framework | The document is the thing you're building |
| Brand voice guide | Reference material you'll use repeatedly |
| Meeting notes → reference doc | Becomes searchable knowledge |
| Software code | The code is the deliverable |
| Process documentation | Describes how to do something |

**Characteristics:**
- Will be referenced later
- Gets refined over time
- Has no natural "done" state (it evolves)
- Lives beyond the work session

### Use Issues When:

The work **IS** the deliverable.

| Example | Why It's an Issue |
|---------|-------------------|
| Research a decision | Once decided, the issue closes |
| Multi-step task with progress | Track state, then done |
| Work you might hand off | Assignable to someone else |
| Anything with a "done" state | Open → In Progress → Closed |

**Characteristics:**
- Has a natural lifecycle (open → done)
- Progress needs tracking
- Might involve multiple people
- Ephemeral - the issue closes when work completes

### The Test

Ask: **"When this work is done, what remains?"**

- If a **document** remains → use a file
- If **nothing** remains (just the outcome) → use an issue

### Why Issues Are Better for Stateful Work

1. **No push required** - Updates sync instantly via GitHub API
2. **Handoff-ready** - Assign to someone else at any point
3. **Natural closure** - When done, close it
4. **Progress timeline** - Comments create a history
5. **Cross-device** - Check status from any device without git

---

## Agent-Ready Documentation

When you hand off work to someone who also has an agent, write for **their agent**, not for them directly.

### Traditional Handoff

You'd summarize and simplify because humans have limited bandwidth:

> "Can you review the pricing page? I think option B is better but want your input."

### Agent-Mediated Handoff

Dump ALL the context because their agent can synthesize it:

> "I've been working on the pricing page. Here's the full context:
>
> **Background:** We need to update pricing for Q2. Current pricing is confusing (see customer feedback in issue #45).
>
> **Options explored:**
> - Option A: Simplify to 2 tiers (analysis in comment below)
> - Option B: Keep 3 tiers but clarify naming (mockup attached)
> - Option C: Usage-based pricing (rejected - too complex for our audience)
>
> **My recommendation:** Option B because [detailed reasoning]
>
> **What I need from you:** Validate the tier names make sense from a customer perspective. You talked to prospects last week - does this framing resonate?
>
> **Decision needed by:** Friday for dev handoff"

### Why More Context Is Better

1. **Your agent captured nuance** you'd forget to mention
2. **Their agent synthesizes** - the human gets a briefing, not a wall of text
3. **Fewer clarification rounds** - context answers questions before they're asked
4. **Better decisions** - full picture leads to better judgment

### The Receiving End

When you receive a detailed handoff, don't read it yourself. Tell your agent:

> "Read issue #67 and brief me on what [person] needs from me. What are the key decision points?"

Your agent extracts what matters. You make the decision. Much faster than reading everything yourself.

---

## The "Anti-Social" Workflow

Agent-mediated collaboration looks anti-social from the outside:
- Fewer meetings
- Fewer quick Slack messages
- More detailed async documentation
- Longer gaps between human interactions

But it's actually **higher bandwidth** communication:
- More context transferred per interaction
- Fewer misunderstandings
- Better decisions from fuller picture
- Work continues even when humans aren't synced

### When This Works Best

- Both parties have capable agents
- Work is complex enough to benefit from documentation
- Async is acceptable (not urgent real-time decisions)
- The overhead of writing context pays off in fewer rounds

### When to Still Talk Directly

- Emotional or sensitive topics
- Rapid iteration needed (real-time brainstorming)
- Building relationship (not just exchanging information)
- Simple things faster to just say

---

## Practical Patterns

### Pattern 1: The Detailed Handoff

When assigning work to someone with an agent:

1. Create an issue with full context
2. Include: background, options considered, your recommendation, what you need from them
3. Assign to them
4. They have their agent brief them

### Pattern 2: The Progress Log

For long-running tasks:

1. Create an issue for the task
2. As you work, add comments with progress
3. Include decisions made, blockers hit, context discovered
4. When pausing, your latest comment is the state
5. Anyone (including future you) can pick it up

### Pattern 3: The Decision Request

When you need input:

1. Do your analysis in an issue
2. Present options with pros/cons
3. State your recommendation
4. Ask the specific question you need answered
5. The other person's agent briefs them on exactly what's needed

### Pattern 4: The Async Review

When you need feedback on work:

1. Put the work in a file or PR
2. Create an issue linking to it
3. Document what kind of feedback you need
4. Their agent can review and summarize concerns

---

## Making It Work

### Start Small

Try one detailed handoff instead of a quick message. See if it reduces back-and-forth.

### Establish Norms

If working with someone regularly, agree:
- "I'll write detailed issues, you have your agent brief you"
- "Don't feel obligated to read everything I write"

### Trust the Process

It feels weird to write "too much." But when the other person has an agent, there's no such thing as too much context - only unusable context (buried, disorganized, irrelevant).

---

## The Mindset Shift

**Old model:** Communication is expensive, so minimize it. Summarize ruthlessly.

**New model:** Communication is cheap (agents handle volume), so maximize context. Let the receiving agent filter.

Your job isn't to pre-digest information for other humans. Your job is to capture context completely. Their agent does the digesting.

---

*This is advanced content. Master the basics first: tasks, /daily, building simple things. Then return here when you're collaborating with others who also have agents.*
