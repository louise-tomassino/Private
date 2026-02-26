---
name: prepping-meetings
description: "Prepare a concise brief before meetings by gathering calendar details, email context, tasks, notes, and attendee research. Use when: prep me for, meeting prep, prepare for meeting, brief me, get ready for call, what do I need to know before."
---

# Prepping Meetings

## Core Principle

Walk into every meeting knowing **who you're meeting, why, and what's happened recently**. Claude gathers the context so you can focus on the conversation, not the scramble.

## When to Use

- "Prep me for my next meeting"
- "Meeting prep"
- "Brief me for the call with [name]"
- "What do I need to know before my 2pm?"
- "Prepare for tomorrow's meetings"
- "Get me ready for the [name] meeting"

## Prerequisites

| Integration | Status | Impact |
|-------------|--------|--------|
| **Google Calendar** | Strongly recommended | Auto-detects meeting details, attendees, time |
| **Gmail** | Recommended | Pulls recent email threads with attendees |
| **GitHub** | Built-in | Checks open tasks/issues for relevant context |
| **Notion** | Optional | Searches for related notes or documents |
| **Web Search** | Built-in | Researches attendees/companies for first meetings |

**No Calendar?** The skill still works — ask the user for meeting details manually. See Fallback Mode below.

---

## Process

### Step 1: Identify the Meeting

**"Prep me for my next meeting"** (auto-detect):
1. Get current time via Calendar MCP
2. List today's events from all calendars
3. Find the next upcoming event with attendees (skip all-day events, focus blocks, and events with no other attendees)
4. If multiple meetings are close together, ask: "You have [Meeting A] at 2pm and [Meeting B] at 3pm. Which one?"

**"Prep me for the call with [name]"** (specific):
1. Search calendar events for the name
2. Find the nearest future match
3. If multiple matches, ask which one

**"Prep me for tomorrow's meetings"** (batch):
1. List tomorrow's events with attendees
2. Ask: "You have [N] meetings tomorrow. Want a brief for all of them, or just specific ones?"
3. Process each selected meeting through Steps 2-5

**No Calendar MCP** (fallback):
1. Ask: "I don't have calendar access. Tell me about the meeting — who are you meeting with, what's it about, and is this a first meeting?"
2. Continue to Step 2 with the provided info

### Step 2: Classify Meeting Type

Infer from the calendar event — don't ask the user.

| Type | Signals | Prep Depth |
|------|---------|------------|
| **First meeting** | No prior events with this person, external domain | Full (include research) |
| **Recurring 1:1** | Weekly/biweekly pattern, same person | Light (recent context only) |
| **Client/external** | External email domains, formal title | Medium-Full |
| **Internal team** | Same email domain, group meeting | Light-Medium |
| **Interview** | "Interview" in title, recruiter in attendees | Full (include research) |
| **Unknown** | Can't determine | Medium (ask if more depth wanted) |

**Detecting "first meeting":**
- Search calendar for prior events with the same attendees (last 90 days)
- Search email for prior threads with attendees
- If both come back empty → first meeting

### Step 3: Gather Context

Run these in parallel where possible. Skip any that don't apply.

#### 3A: Calendar Context
- Meeting title, time, duration, location/link
- Attendee list with names and email addresses
- Meeting description/agenda (if any)
- Recurring? If so, when was the last one?

#### 3B: Email Context
- Search Gmail for recent threads with each attendee (last 30 days)
- For each thread: subject line and 1-line summary
- Flag threads that look unresolved or action-pending
- Limit: top 5 most recent threads per attendee

Gmail search pattern:
```
from:{attendee-email} OR to:{attendee-email} newer_than:30d
```

#### 3C: Task Context
- Search open GitHub issues that mention attendee names or meeting topic
- Check tasks assigned that relate to the meeting context
- Limit: top 3 most relevant

#### 3D: Notion Context (if configured)
- Search Notion for pages mentioning attendee names or meeting topic
- Limit: top 2 most relevant, show title and 1-line summary

#### 3E: Research (first meetings and client meetings)
- Search the web for the person's name + company
- Look for: role, company overview, recent news
- LinkedIn profile context if discoverable
- Keep it brief: 2-3 bullet points per person, not a dossier

---

### Step 4: Assemble the Brief

Present a single, scannable output. Format depends on meeting type.

#### Full Brief (first meetings, interviews)

```markdown
## Meeting Brief: [Meeting Title]

**When:** [Day], [Date] at [Time] ([duration])
**Where:** [Location or video link]
**With:** [Name 1] (Role/Company)

### About [Name/Company]
- [Role and company — 1 sentence]
- [What the company does — 1 sentence]
- [Notable recent news or context — 1 sentence, if found]

### What This Meeting Is Likely About
- [Inferred from calendar title, description, or email context]

### Talking Points
- [Suggested conversation starters based on research]

### Recent Context
- [Email threads if any exist]
- [Related tasks or Notion pages]
- [Or "No prior history found"]
```

#### Standard Brief (most meetings)

```markdown
## Meeting Brief: [Meeting Title]

**When:** [Day], [Date] at [Time] ([duration])
**Where:** [Location or video link]
**With:** [Name 1] (Role/Company), [Name 2] (Role/Company)

### Agenda
- [From calendar description, or "No agenda provided"]

### Recent Context
- **[Thread subject]** — [1-line summary]
- **[Thread subject]** — [1-line summary]
- **[Task #XX]** — [Open task relevant to this meeting]
- **[Notion page]** — [Related note or document]

### Open Questions / Action Items
- [Anything unresolved from email threads]
- [Any overdue tasks related to attendees]

### Quick Notes
- [Anything else notable — "Last met 2 weeks ago", "First time meeting", etc.]
```

#### Light Brief (recurring 1:1s, internal meetings)

```markdown
## Quick Brief: [Meeting Title]

**When:** [Time] ([duration])
**With:** [Name(s)]

### Since Last Meeting
- **[Recent email thread]** — [Summary]
- **[Open task]** — [Status]

### Heads Up
- [Anything time-sensitive or noteworthy]
- [Or "Nothing flagged — you're up to date"]
```

### Step 5: Offer Follow-ups

After presenting the brief, offer relevant options only:

> "Anything else you want me to dig into before the meeting?"

Possible follow-ups (only offer what's relevant):
- Research an attendee more deeply
- Pull up a specific email thread
- Draft talking points or questions
- Check availability for a follow-up meeting

Don't list all options every time. A recurring 1:1 doesn't need "research this person more deeply."

---

## Batch Mode

When prepping multiple meetings (e.g., "prep me for tomorrow"):

1. Present a summary table first:

```markdown
## Tomorrow's Meetings

| Time | Meeting | With | Prep Depth |
|------|---------|------|------------|
| 9:00 | Weekly standup | Team (5 people) | Light |
| 11:00 | Call with Sarah | Sarah Chen (Acme Corp) | First meeting |
| 14:00 | 1:1 with Mike | Mike (internal) | Light |
| 16:00 | Board update | Board members (4 people) | Medium |
```

2. Ask: "Want briefs for all of them, or just specific ones?"
3. Generate briefs in chronological order
4. Use the appropriate depth for each

---

## Edge Cases

### No calendar events found
> "Your calendar looks clear. Are you looking to prep for a specific meeting? Tell me who you're meeting with."

### Event has no attendees
> "I found '[Event Title]' at [time], but there are no attendees listed. Is this a meeting with someone?"

### No email history with attendees
Don't mention prominently. In Recent Context, write "No recent email threads found." For first meetings this is expected — focus on research instead.

### Generic email address (info@, hello@, noreply@)
Skip email search for that address. Use the attendee's display name for web research.

### Meeting is far in the future (> 7 days)
> "That meeting is on [date]. Want me to prep now, or should I remind you closer to the date?"

If later: create a task "Prep for [meeting]" due 1 day before.

### Multiple calendars
Query all configured calendars. If same timeslot has events on different calendars, present both and ask which one.

### "Prep all my meetings today"
Use batch mode. Skip meetings that already happened and events without attendees (focus blocks, reminders).

---

## Quality Markers

- Brief takes **under 30 seconds to scan** for light, under 60 for full
- Every brief includes **who, when, where** at the top
- Recent context uses **thread subjects as anchors** (scannable, not prose)
- Research is **3 bullets max per person** (not a biography)
- Open questions are **specific and actionable**
- Brief depth **matches the meeting type** (don't over-prep standups, don't under-prep first meetings)
- Follow-up options are **relevant to the specific meeting**

## Anti-Patterns

### The Information Dump
**Problem:** Pasting full email threads or long research paragraphs.
**Fix:** Summarize to one line per thread. The user wants context, not content.

### The Over-Prepped Standup
**Problem:** Running full research for a recurring team meeting.
**Fix:** Classify the meeting type first. Recurring internal meetings get light briefs.

### The Missing Calendar Check
**Problem:** Asking the user for meeting details when Calendar MCP is configured.
**Fix:** Always try calendar first. Only ask manually if lookup fails or returns nothing.

### The Stale Context
**Problem:** Pulling emails from months ago that aren't relevant.
**Fix:** Default to 30-day window. Only go further back for first meetings with no recent history.

### The Generic Follow-up
**Problem:** Offering the same four options regardless of context.
**Fix:** Only offer follow-ups that make sense for this specific meeting.

### The Wall of Text
**Problem:** Writing paragraphs instead of structured output.
**Fix:** Use headers, bullets, bold anchors. Brief should be glanceable on a phone screen.
