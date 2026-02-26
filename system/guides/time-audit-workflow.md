# Time Audit Workflow

A structured process to identify high-leverage opportunities for AI automation. Based on the Harvard Business School CEO time studies and Serhant's Task Triage methodology.

## Why This Matters

Most people think they know where their time goes. Research shows they're wrong. The [Porter-Nohria study](https://hbr.org/2018/07/how-ceos-manage-time) tracked 60,000+ CEO hours and found consistent gaps between perception and reality.

This audit surfaces:
- Where your time actually goes (not where you think it goes)
- Which tasks are high-leverage candidates for AI automation
- Hidden patterns you can't see without data

---

## Choose Your Audit Duration

| Duration | Best For | Check-ins | Total Entries |
|----------|----------|-----------|---------------|
| **3-day sprint** | Quick insights, testing the process, busy schedules | 4/day | ~12 |
| **7-day standard** | Solid patterns, weekday + weekend variance | 4/day | ~28 |
| **14-day deep** | Comprehensive analysis, bi-weekly patterns | 4/day | ~56 |

**Recommendation:** Start with 3-day sprint to test the process, then do a 7-day if you want deeper insights.

---

## Setup Checklist

Before starting the audit, complete these steps:

### 1. Choose Your Duration
- [ ] Decide: 3-day, 7-day, or 14-day
- [ ] Pick start date (ideally a Monday for 7-day)

### 2. Create Calendar Blocks

Create recurring calendar events for check-ins:

| Time | Purpose |
|------|---------|
| **10:00 AM** | Morning check-in (captures early work) |
| **1:00 PM** | Midday check-in (captures late morning) |
| **4:00 PM** | Afternoon check-in (captures post-lunch) |
| **7:00 PM** | Evening check-in (captures late afternoon + any evening work) |

**Calendar event title:** "Time Audit Check-in 📊"
**Calendar event description:** "Run `/audit log` in Claude"

### 3. Create Task

Add to your task system:
- **Task:** "Complete Time Audit"
- **Due date:** End of your audit period
- **Area:** Work (or whichever area fits)

### 4. Create Data Storage

The audit skill will create a Google Sheet with these columns:
- Timestamp
- Time Block (which check-in)
- Activities (what you did)
- Venture/Project
- Work Type (Analysis, Creation, Communication, Coordination, Decision, Relationship, Execution)
- Energy Level (High/Medium/Low)
- Initiated By (You/Reactive)
- AI Potential (Yes/Partially/No)
- Notes

---

## During the Audit

### At Each Check-in

When your calendar reminder fires:

1. Open Claude
2. Run `/audit log`
3. Answer the questions about your last few hours
4. Takes 2-3 minutes

### What Gets Captured

For each time block, the skill asks:
- What did you work on? (specific activities, not vague categories)
- Which venture/project was this for?
- What type of work was it?
- How was your energy?
- Did you initiate this, or was it reactive?
- Could AI have helped with this?

### Tips for Accurate Capture

- **Be specific:** Not "emails" but "responded to investor questions about Q4 projections"
- **Include context switches:** If you bounced between things, note that
- **Capture the unproductive:** Scrolling, waiting, being stuck—it all counts
- **Note energy honestly:** When were you sharp? When were you depleted?

---

## End of Audit: Analysis

### Run the Analysis

On your final day, run `/audit analyze`. This will:

1. Pull all data from the sheet
2. Calculate time distribution across:
   - Ventures/projects
   - Work types
   - Energy patterns
   - Reactive vs. initiated
3. Identify high-leverage AI candidates
4. Generate a report with recommendations

### The Leverage Matrix

The analysis produces a matrix crossing:

**Work Type** × **Leverage Category**

| | Only I Can Do | I Shouldn't Do | Could Do Better with AI |
|---|---|---|---|
| Analysis/Synthesis | | | ← AI opportunity zone |
| Creation | | | ← AI opportunity zone |
| Communication | | | ← AI opportunity zone |
| Coordination | | | |
| Decision-Making | | | |
| Relationship | | | |
| Execution | | | |

### High-Leverage Candidates

Tasks that score highest for AI automation potential are:
- **Repetitive:** You do them weekly or more often
- **Knowledge-intensive:** Thinking, writing, analyzing (not just scheduling)
- **High-value output:** The result matters to your goals
- **Information-bottlenecked:** Slow because of research, synthesis, or drafting

---

## After the Audit

### Prioritize 1-2 Workflows

Don't try to automate everything. Pick the highest-leverage opportunity and build a complete workflow for it.

Questions to ask:
- Which task, if 5x faster, would most impact my wealth-building goals?
- Which task appears across multiple ventures?
- Which task do I dread but can't delegate?

### Build the System

For your chosen task:
1. Document the current process in detail
2. Design the AI-augmented workflow
3. Create prompts/skills to execute it
4. Test and iterate

### Schedule Next Audit

Drucker recommended audits twice a year. Put a reminder for 6 months out.

---

## For Alfred Clients

This same workflow works for clients with modifications:

### Session 1: Setup (30 min)
- Explain the methodology
- Help them choose duration
- Set up calendar blocks together
- Create the data sheet

### Async: Capture (3-7 days)
- Client runs `/audit log` on their own
- Light-touch support if they have questions

### Session 2: Analysis (60 min)
- Run analysis together
- Discuss findings and patterns
- Identify top AI opportunities
- Plan next steps

---

## Quick Reference

| Phase | Action | Tool |
|-------|--------|------|
| Setup | Choose duration, create calendar blocks, create task | Manual + Claude |
| Capture | Log activities at each check-in | `/audit log` |
| Analysis | Generate insights and recommendations | `/audit analyze` |
| Action | Build workflow for top opportunity | Custom |
