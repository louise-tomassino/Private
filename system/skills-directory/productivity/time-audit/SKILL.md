---
name: time-audit
description: "Track and analyze how you spend time to find AI automation opportunities. Use when: time audit, audit log, audit analyze, track my time, where does my time go."
---

# Time Audit

## Core Principle

You can't optimize what you don't measure. This skill captures where time actually goes (not where you think it goes) and identifies high-leverage opportunities for AI automation.

## When to Use

- `/audit setup` or "start a time audit"
- `/audit log` or "log my time"
- `/audit analyze` or "analyze my time audit"

## Commands

### Setup: `/audit setup`

Initializes a new audit period.

**Process:**
1. Ask: "How long do you want to run this audit? (3 days / 7 days / 14 days)"
2. Ask: "When do you want to start? (today / tomorrow / specific date)"
3. Create Google Sheet with columns:
   - Timestamp
   - Day Number
   - Time Block (Morning/Midday/Afternoon/Evening)
   - Activities
   - Venture/Project
   - Work Type
   - Energy Level
   - Initiated By
   - AI Potential
   - Notes
   - Time Spent (band)
   - Bottleneck (for AI candidates, filled at evening check-in)
4. Create calendar events for check-ins (10am, 1pm, 4pm, 7pm) for the duration
5. Create task: "Complete Time Audit" with due date
6. Confirm setup complete and explain next steps

**Sheet naming:** "Time Audit - [Start Date]"

---

### Log: `/audit log`

Quick capture of recent activities. Run at each check-in.

**Process:**

1. **Determine time block** based on current time:
   - Before 11:30am → Morning (covers ~6am-10am)
   - 11:30am-2:30pm → Midday (covers ~10am-1pm)
   - 2:30pm-5:30pm → Afternoon (covers ~1pm-4pm)
   - After 5:30pm → Evening (covers ~4pm onward)

2. **Ask for everything at once:**
   > "What have you been working on since your last check-in? Just describe what you did—I'll ask follow-up questions."

3. **Ask clarifying follow-up questions:**

   Always probe for completeness and clarity:

   **Completeness check:**
   > "Was there anything else? Any personal/private things that came up — interruptions, errands, breaks, distractions?"

   **Clarity probes** (ask 1-2 as relevant):
   - If activity is vague: "When you say [X], what specifically were you doing?"
   - If multiple things bundled: "Can you break that down a bit — what were the distinct activities?"
   - If project unclear: "Which project/venture was that for?"
   - If it sounds reactive: "Did something trigger that, or did you choose to do it?"

4. **Claude classifies silently, then confirms:**

   Parse the response and classify each activity by:
   - Project (extract from context)
   - Work Type (Analysis/Creation/Communication/Coordination/Decision-Making/Relationship/Execution/Other)
   - Estimate if reactive or initiated based on description

   Present back:
   > "Here's what I captured:
   >
   > 1. [Activity] → Project: [X], Type: [Y], Reactive/Initiated: [Z]
   > 2. [Activity] → Project: [X], Type: [Y], Reactive/Initiated: [Z]
   > ...
   >
   > Does this look right? Any corrections?"

4. **Ask only the questions Claude can't infer:**

   **Time spent (always ask):**
   > "Roughly how long did each activity take?"

   Use time bands: <15min, 15-30min, 30-60min, 1-2hrs, 2-4hrs, 4hrs+

   **Energy (always ask):**
   > "How was your energy overall this block? (High / Medium / Low)"

   **AI Potential (always ask):**
   > "For any of these tasks, could AI have helped? Which ones, and how?"

   **If Work Type = "Other":**
   > "You mentioned [activity] which doesn't fit the standard categories. What type of work would you call this? Should we add it as a new category?"

   If a new category is suggested, note it in the Notes column and flag for review at analysis time.

5. **Evening check-in only — deeper dive on AI candidates:**

   For any task marked "Yes" or "Partially" for AI potential today, ask:
   > "For [task], what was the bottleneck? (Research/Gathering info, Thinking/Deciding, Writing/Drafting, Waiting on others, Something else)"

   Record in Bottleneck column.

6. **Write to Google Sheet** - append a row for each activity

8. **Confirm briefly:**
   > "Logged [X] activities. Next check-in: [time]."

**Keep it fast but thorough:** Morning/Midday/Afternoon check-ins: 3-4 minutes. Evening check-in: 5-7 minutes (includes bottleneck questions). The follow-up questions are essential — don't skip them to save time.

---

### Analyze: `/audit analyze`

Run at the end of the audit period. Generates insights and recommendations.

**Process:**

1. **Pull all data** from the Google Sheet

2. **Calculate distributions:**

   **By Venture/Project:**
   - Hours per venture
   - % of total time

   **By Work Type:**
   - Hours per type
   - % of total time

   **By Energy Level:**
   - When are high-energy periods?
   - What work happens during low energy?

   **By Initiation:**
   - % reactive vs. self-initiated
   - What triggers reactive work?

   **By AI Potential:**
   - Hours marked "Yes" or "Partially"
   - % of total time

3. **Create the Leverage Matrix:**

   Cross-reference Work Type with AI Potential to identify the opportunity zone:

   ```
   High AI Potential + Analysis/Synthesis = TOP PRIORITY
   High AI Potential + Creation = TOP PRIORITY
   High AI Potential + Communication = HIGH PRIORITY
   High AI Potential + Coordination = MEDIUM PRIORITY (often already automated)
   ```

4. **Identify top 3 automation candidates:**

   Look for tasks that are:
   - Marked "Yes" or "Partially" for AI Potential
   - Repetitive (appear multiple times)
   - In Analysis, Creation, or Communication categories
   - Currently taking significant time

5. **Generate Report:**

   ```markdown
   # Time Audit Results

   **Period:** [Start Date] - [End Date]
   **Total Check-ins:** [X]
   **Total Activities Logged:** [X]

   ## Time Distribution

   ### By Venture/Project
   [Table with hours and percentages]

   ### By Work Type
   [Table with hours and percentages]

   ### Energy Patterns
   [When are you most/least energized?]

   ### Reactive vs. Initiated
   [X]% of your time is reactive

   ## AI Automation Opportunities

   ### The Leverage Matrix
   [Matrix showing Work Type × AI Potential]

   ### Top 3 Candidates for AI Automation

   1. **[Task/Activity]**
      - Current time spent: ~X hours/week
      - Work type: [Type]
      - Why it's a good candidate: [Reason]
      - Potential approach: [Suggestion]

   2. **[Task/Activity]**
      ...

   3. **[Task/Activity]**
      ...

   ## Recommended Next Steps

   1. [Specific action]
   2. [Specific action]
   3. [Specific action]
   ```

6. **Discuss findings** with the user and help them choose which opportunity to pursue first.

---

## Work Type Definitions

Use these to classify activities consistently:

| Type | Description | Examples |
|------|-------------|----------|
| **Analysis/Synthesis** | Making sense of information, drawing conclusions | Research, reviewing data, comparing options, reading and summarizing |
| **Creation** | Producing something new | Writing content, designing, coding, building presentations |
| **Communication** | Exchanging information | Email, calls, messages, meetings where info is shared |
| **Coordination** | Managing logistics | Scheduling, planning, organizing, delegating |
| **Decision-Making** | Choosing between options with stakes | Investment decisions, hiring, strategy choices |
| **Relationship** | Building trust and connection | Networking, 1:1s focused on rapport, negotiations |
| **Execution** | Doing the core work | Depends on role—for investor: due diligence calls; for consultant: client delivery |
| **Other** | Doesn't fit above categories | Flag for review—may need new category |

**Handling "Other":** When an activity doesn't fit, ask the user to describe what type of work it is. Track these in the Notes column. During analysis, review if any "Other" entries suggest a missing category that should be added for future audits.

---

## Quality Markers

- Check-ins take <3 minutes
- Activities are specific, not vague
- All fields captured for each activity
- Analysis produces actionable recommendations
- User leaves with clear next step

## Anti-Patterns

- Spending too long on each check-in (this isn't journaling)
- Vague activity descriptions ("worked on stuff")
- Skipping the AI Potential question (this is the whole point)
- Analyzing without enough data (<8 check-ins)
- Recommending too many things (focus on top 1-2)
