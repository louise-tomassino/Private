---
name: whats-possible
description: "Show the user what Alfred OS can do, with concrete examples and inspiration. Use when: what can I do, what's possible, show me what you can do, what are you good at, inspire me, I'm bored, now what, what should I try, what else can you do."
---

# What's Possible with Alfred OS

## When to Use

- "What can I do?"
- "What's possible?"
- "Show me what you can do"
- "What should I try next?"
- "Now what?"
- "I'm not sure what to use this for"
- User seems stuck or unsure what to do next

## Core Principle

Don't dump a list. **Ask about their situation first**, then suggest the most relevant capabilities with concrete examples. Make it feel like a conversation, not a brochure.

---

## How to Respond

### Step 1: Understand their context

Quickly check:
- What have they already set up? (Check CLAUDE.md for repos, MCPs, Learning Progress)
- What do they do? (Check "Who I Am" section)
- What are they working on right now? (Ask if unclear)

### Step 2: Suggest based on their situation

Pick 3-5 relevant capabilities from the list below. For each one:
1. Name it simply
2. Give a concrete example using their actual context
3. Tell them how to try it right now

**Example response:**

> Based on your setup, here are some things you might find useful:
>
> **1. Morning briefing** — Start each day with `/daily`. I'll pull your tasks, calendar, and flag anything urgent. Try it now.
>
> **2. Email processing** — Instead of going through your inbox manually, say "Process my inbox" and I'll categorize everything, draft replies for the ones that need attention, and summarize the rest.
>
> **3. Meeting prep** — Before your next meeting, say "Prep me for my meeting with [name]." I'll check your calendar, pull up recent emails with them, and give you a briefing.
>
> **4. Build a tool** — You mentioned wanting to track [X]. Say "Create a new project for [X]" and we can build it together — no coding needed.
>
> Want to try any of these?

---

## Capability Library

Organize suggestions by what they've set up and what might interest them.

### If they have Tasks set up (GitHub Issues)

| You say... | What happens |
|------------|-------------|
| "What are my tasks?" | Lists all open tasks, organized by category |
| "Add a task: [anything]" | Creates a task with the right label |
| "What's urgent?" | Shows today-priority tasks and things with deadlines |
| "/daily" | Full morning briefing — tasks, calendar, priorities |
| "/weekly" | Weekly planning — review last week, set this week's focus |
| "What did I accomplish this week?" | Summary of completed tasks |

### If they have Email set up (Gmail MCP)

| You say... | What happens |
|------------|-------------|
| "What's in my inbox?" | Quick summary of recent/starred emails |
| "Process my inbox" | Full workflow: categorize, draft replies, create digest |
| "Draft a reply to [person] about [topic]" | Writes a reply in your voice |
| "Find that email from [person] about [topic]" | Searches your inbox |
| "Summarize the email thread with [person]" | Catches you up on a conversation |

### If they have Calendar set up (Calendar MCP)

| You say... | What happens |
|------------|-------------|
| "What's on my calendar today?" | Today's schedule |
| "What does my week look like?" | Week overview with free/busy blocks |
| "Prep me for my next meeting" | Pulls agenda, attendees, recent context |
| "When am I free this week?" | Available time slots |
| "Schedule [event] for [time]" | Creates a calendar event |

### For any user (no setup required)

| You say... | What happens |
|------------|-------------|
| "Research [topic] and save a summary" | Web research → saved to a file you can reference |
| "Help me plan [project/trip/event]" | Structured planning with tasks and timeline |
| "Write a [document type] about [topic]" | Creates a real document on your computer |
| "Build a brand voice" | Interviews you about your communication style |
| "Help me think through [decision]" | Structured pros/cons, considerations, recommendation |

### For users ready to build (intermediate)

| You say... | What happens |
|------------|-------------|
| "Create a new project for [idea]" | Scaffolds a complete project repo from the Alfred OS template (see `references/creating-projects.md` for the full process) |
| "Build me a [dashboard/tool/app]" | Actually builds working software, no coding needed |
| "Create a website for [business/project]" | Full web app, deployable to the internet |
| "Automate [workflow]" | Builds a custom skill that runs on command |
| "Track [anything] in a spreadsheet" | Creates or updates Google Sheets with structured data |

### Skills & Security

| You say... | What happens |
|------------|-------------|
| "Create a skill for [workflow]" | Builds a custom skill (uses the `creating-skills` skill) |
| "I downloaded a skill, is it safe?" | Reviews the skill for security and quality (uses the `reviewing-skills` skill) |
| "What skills are available?" | Browse and install optional skills from the catalog (uses the `installing-skills` skill) |
| "/security-check" | Monthly audit of your entire Alfred OS setup |

### Real-world examples by persona

**For executives / business owners:**
- "Prepare a weekly report for my team based on what I accomplished"
- "Research [competitor] and summarize their recent moves"
- "Draft a proposal for [client] based on our conversation"
- "Find leads for [product/service]"
- "Create a presentation outline for [topic]"

**For parents / family managers:**
- "Plan our summer vacation to [destination]"
- "Create a meal plan for the week"
- "What school events are coming up?" (if calendar connected)
- "Help me organize the kids' activity schedule"
- "Track our household budget this month"

**For professionals / consultants:**
- "Summarize my meeting notes and extract action items"
- "Draft a follow-up email to [client] after today's meeting"
- "Create a project plan for [deliverable]"
- "Research best practices for [topic] and save a brief"
- "Build a client intake form as a web app"

---

## If They've Tried Everything

For advanced users who've mastered the basics:

1. **Create custom skills** — "What workflows do you repeat? Let's automate them."
2. **Build software** — "What tool do you wish existed? Let's build it."
3. **Optimize your system** — "Let's review your CLAUDE.md and make it more specific. The more it knows about you, the better every interaction gets."
4. **Teach Claude your voice** — "Run 'Build a brand voice' so I can write in your style."
5. **Connect more tools** — "Are there other services you use daily that we could connect?"

---

## Anti-Patterns

- Don't list everything at once — pick 3-5 relevant options
- Don't be generic — use their name, their repos, their actual work
- Don't assume they know jargon — say "morning briefing" not "daily sync command"
- Don't overwhelm beginners — start with what's already set up
- Always end with "Want to try one of these?" — make it actionable
