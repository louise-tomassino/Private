---
name: reviewing-presentations
description: "Review and develop presentations through structured feedback on structure, content, and design. Use when: review presentation, presentation feedback, improve my slides, check my deck, workshop presentation."
---

# Reviewing Presentations

## Core Principle

Good feedback makes the presenter want to go back to work — not feel overwhelmed.

## When to Use

- User shares a presentation and wants feedback
- User says "review my presentation" or "check my slides"
- User says "is my deck working?" or "improve my presentation"
- User asks for help developing or iterating on a presentation
- User is preparing a workshop or educational presentation

## Process

### Step 1: Understand Before Evaluating

Before giving any feedback, gather context:

1. **Read the full presentation.** Don't comment on individual slides before understanding the whole arc.
2. **Ask three questions:**
   - "What's the goal of this presentation?" (inform, persuade, teach, sell?)
   - "Who's the audience?" (expertise level, what they care about, group size)
   - "How far along are you?" (rough draft, solid draft, nearly final?)

The completion stage determines what feedback is appropriate:

| Stage | Focus On | Don't Focus On |
|-------|----------|----------------|
| **Rough draft** (30%) | Overall story, structure, whether it solves the right problem | Slide design, font sizes, polish |
| **Solid draft** (60%) | Flow, section balance, content clarity, narrative arc | Minor wording, pixel-level design |
| **Near-final** (90%) | Design polish, consistency, typography, final wording | Structural changes (too late) |

### Step 2: Start with What's Working

Before any critique, identify what lands. Not as flattery — as signal.

Use "I notice..." framing:
- "I notice the opening creates real tension between old and new — that's effective."
- "I notice the three-layer diagram makes the architecture immediately clear."
- "I notice the energy shifts up at the demo section — that's well-placed."

This tells the presenter what their audience will actually take away. It also protects the good parts from being accidentally changed during revision.

### Step 3: Ask What They Want Help With

Before giving your full assessment, ask:

> "What part are you least sure about? Where do you want the most help?"

This gives the presenter control. They may know exactly where the weak spots are. Start there.

### Step 4: Structured Feedback

Organize feedback into three tiers. Limit to **3-5 items per tier** — depth over volume.

**Must Address** — Issues that undermine the presentation's purpose:
- Structural problems (narrative doesn't build, sections in wrong order)
- Missing setup (solution presented before the audience feels the problem)
- Audience mismatch (too technical, too basic, wrong assumptions)
- Key message is buried or unclear

**Should Consider** — Issues that would meaningfully improve it:
- Flow between sections (abrupt transitions, energy dips)
- Balance problems (one section too heavy, another too light)
- Content that doesn't earn its place (slides that don't advance the argument)
- Missing engagement moments (long stretches without audience involvement)

**Could Refine** — Polish and design items (flag, don't belabor):
- Visual consistency issues
- Slide density problems
- Typography and readability
- Minor content refinements

### Step 5: Evaluate Each Dimension

Work through these dimensions, focusing on whichever are most relevant to the presentation's stage:

#### Structure & Narrative

- **The headline test:** Read only the slide titles in sequence. Do they tell a coherent story? If they read like a table of contents ("Introduction," "Background," "Data"), the narrative is weak.
- **Setup before solution:** Does the deck establish a problem before presenting answers? A solution without a problem feels unmotivated.
- **The arc:** Is there a clear progression? Look for the pattern: "What is" (current reality) → tension → "What could be" (the vision) → how to get there.
- **The climax:** Is there one identifiable "aha" moment the whole deck builds toward?
- **The close:** Does the final slide drive action, not just say "Thank you" or "Questions?"

Refer to `references/evaluation-framework.md` for detailed narrative assessment criteria.

#### Content Per Slide

- **One idea per slide.** If you need two sentences to describe what a slide is "about," it should be two slides.
- **The 5-second test:** Could someone identify the main point within 5 seconds?
- **Headline quality:** Are headlines assertions ("58% of users drop off at checkout") or topic labels ("Key Findings")? Assertions are stronger.
- **Redundancy check:** Is the presenter going to read aloud what's written? That hurts comprehension — the audience can either read or listen, not both.
- **Does it earn its place?** Every slide should advance the argument. If you removed it, would the presentation suffer?

#### Design & Visual

- **Visual hierarchy:** Is there one dominant element per slide? Does the eye know where to go first?
- **Density:** Count the elements on each slide. Beyond 6, cognitive load spikes.
- **Text size:** For live presentations, body text should be 24pt minimum, titles 32pt+. If it can't be read from the back of the room, it fails.
- **Whitespace:** Is there breathing room, or is content packed edge-to-edge?
- **Consistency:** Do all slides look like they belong to the same deck?
- **Tables:** More than 5 columns or 6 rows? It probably needs to be split or simplified.

Refer to `references/design-criteria.md` for detailed design checkpoints.

#### Timing & Pacing

- **Section balance:** Are any sections disproportionately long or short?
- **Engagement rhythm:** Is there an interaction (question, exercise, discussion) at least every 15-20 minutes?
- **Energy map:** Where does the energy peak? Where might attention drop? Long sequences of text-heavy slides create dips.
- **Breather slides:** Are there moments of visual relief between dense sections?

#### Workshop-Specific (if applicable)

Workshop slides serve action, not just information. Evaluate differently:

- **Activity slides:** Do they clearly state what to do, how long, and what the output should be?
- **Instructions:** Are they numbered steps, not paragraphs?
- **Content-to-activity ratio:** A workshop that's 80% content slides is a lecture in disguise.
- **The "remove the facilitator" test:** Could a participant figure out what to do from the slide alone? If not, the instructions aren't clear enough.
- **Reflection moments:** Are there pause slides between content blocks?

### Step 6: Use Generative Framing

Frame suggestions as possibilities, not commands:

- **"What if..."** — "What if the customer story came before the data?"
- **"I wonder..."** — "I wonder if this section would land harder as a visual instead of bullets."
- **"Have you considered..."** — "Have you considered splitting this into two slides?"

This keeps the presenter in the driver's seat. They know their audience and context better than you do.

### Step 7: Close with Forward Motion

End every review with:

1. **Summary of the 3 most impactful changes** — specific, actionable, prioritized
2. **What to work on next** — don't try to fix everything at once
3. **An invitation to come back** — "After you revise the structure, I can do a closer pass on individual slides."

## Output Format

Structure feedback as:

```markdown
## Presentation Review: [Title]

### What's Working
- [2-3 specific observations about what lands]

### Must Address
1. **[Issue]** — [Specific slide or section]. [What's wrong]. [Suggested direction].

### Should Consider
1. **[Issue]** — [Specific slide or section]. [What's wrong]. [Suggested direction].

### Could Refine
1. **[Issue]** — [Specific slide or section]. [Brief note].

### Recommended Next Steps
1. [Most impactful change to make first]
2. [Second priority]
3. [Third priority]

Ready for another pass when you've revised.
```

Always cite specific slide numbers or section names. "Slide 12 has too many elements" is useful. "Some slides are busy" is not.

## Quality Markers

- Feedback is calibrated to the presentation's stage (structural for drafts, polish for near-final)
- Every critique cites a specific slide or section
- Suggestions are framed as possibilities, not commands
- The presenter feels clear on their next 3 actions
- Workshop presentations are evaluated for participation design, not just content
- The presenter wants to go back to work after receiving feedback

## Anti-Patterns

### The Wall of Criticism
**Problem:** Dumping 25 issues at once. The presenter is paralyzed.
**Fix:** Limit to 3-5 items per tier. Prioritize by impact. Iterate across rounds.

### The Premature Polish
**Problem:** Giving font critiques on a rough draft. Suggesting color changes when the structure is broken.
**Fix:** Always assess the stage first. Structure → flow → design → polish.

### The Generic Comment
**Problem:** "This slide is too busy" or "Make it simpler" with no specifics.
**Fix:** Cite the slide number, name the elements competing for attention, suggest what to cut or split.

### The Redesign
**Problem:** Rewriting the presentation instead of reviewing it. Imposing your style.
**Fix:** The goal is to help the presenter achieve *their* vision. Ask about their intent before overriding it.

### The Checklist Robot
**Problem:** Mechanically running through every criterion regardless of relevance.
**Fix:** Read the room. A rough draft needs structural feedback, not a typography audit. Focus on what matters most at this stage.

### Ignoring the Audience
**Problem:** Evaluating a beginner workshop presentation by keynote standards, or vice versa.
**Fix:** Always anchor feedback to the specific audience and context. What works for a TED talk fails in a training session.
