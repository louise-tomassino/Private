# Managing People

How to track the people you work with — clients, partners, collaborators, or anyone you interact with regularly.

---

## When to Use This

Not every contact needs a folder. This pattern is for people you interact with **repeatedly** and want to track over time — like a lightweight CRM built into your file system.

Good candidates:
- Clients or customers you serve
- Business partners or collaborators
- Mentors, coaches, or advisors
- Key contacts in your network

If you just need someone's email or phone number, a simple contacts list in `3-resources/contacts/` is fine.

---

## The Structure

Create a `people/` key area, then one folder per person:

```
1-key-areas/people/
├── anna-berg/
│   ├── 0-profile.md        # Who they are, how you work together
│   ├── 1-intro-call.md     # First significant interaction
│   ├── 2-project-kickoff.md
│   ├── worklog.md           # Running activity log
│   └── ...
├── carlos-mendez/
│   ├── 0-profile.md
│   ├── worklog.md
│   └── ...
└── overview.md              # Optional: dashboard of all people
```

### Naming conventions

- **Folder name:** lowercase, hyphenated (`first-last`)
- **Numbered files:** use prefixes to show chronological order (`1-`, `2-`, `3-`...)
- **Profile:** always `0-profile.md` (the zero keeps it at the top)
- **Worklog:** always `worklog.md`

---

## The Profile (`0-profile.md`)

This is the "CRM card" — everything you need to know about someone at a glance.

```markdown
# Profile: [Name]

## Basic Info

| Field | Value |
|-------|-------|
| **Name** | |
| **Location** | |
| **Email** | |
| **Phone** | |
| **How we connected** | |
| **Date of first contact** | |

## Background

Who they are, what they do, what matters to them.

## How We Work Together

What's the relationship? What are you doing together? Any special circumstances?

## Notes

Anything else worth knowing — personality, preferences, things to be aware of.
```

Adapt it to your needs. If you're tracking clients, you might add sections for invoicing or project timeline. If it's a mentor, you might track topics discussed.

---

## The Worklog (`worklog.md`)

A running log of interactions, appended after each significant touchpoint. Most recent entries first.

```markdown
# Worklog — [Name]

Activity log appended after each interaction. Most recent entries first.

---

## 2026-02-15

Had a call about the Q1 roadmap. Agreed on three priorities. She'll send the brief by Friday.

---

## 2026-02-03

Intro meeting. Discussed background, goals, and what she's looking for. Sent follow-up email with next steps.

---
```

**What to log:**
- Meetings, calls, significant emails
- Decisions made together
- Action items and follow-ups
- Status changes in the relationship

**What not to log:**
- Every single email or message
- Things already captured in numbered files
- Routine, low-value interactions

---

## Numbered Interaction Files

For significant interactions that deserve their own document — meetings, workshops, discovery calls, presentations — create a numbered file:

```
1-intro-call.md
2-project-kickoff.md
3-quarterly-review.md
4-workshop-notes.md
```

These are for detailed notes. The worklog is for the quick summary.

---

## The Overview (Optional)

If you're managing multiple people, an `overview.md` gives you a dashboard:

```markdown
# People Overview

| Person | Relationship | Status | Next Step |
|--------|-------------|--------|-----------|
| **Anna Berg** | Client | Active project | Send proposal by Friday |
| **Carlos Mendez** | Partner | Ongoing | Monthly check-in next week |
| **Fatima Al-Rashid** | Advisor | Active | Schedule Q2 review |
```

---

## Grouping by Role (Optional)

If you have many people, you can add a level of grouping:

```
1-key-areas/people/
├── clients/
│   ├── anna-berg/
│   └── carlos-mendez/
├── partners/
│   └── fatima-al-rashid/
└── overview.md
```

Only add this structure when the flat list starts feeling cluttered. Start flat, add grouping later if needed.

---

## Tips

- **Let it grow organically.** Start with one person folder when you need it. Don't pre-create empty folders.
- **Claude maintains the worklog.** After interactions, Claude appends entries automatically — you don't need to write them yourself.
- **The profile evolves.** Update it as you learn more about someone. It's a living document, not a one-time form.
- **Archive when done.** If a relationship wraps up, move the folder to `4-archive/`.

---

*See also: `organizing-your-information.md` for how the four-folder system works.*
