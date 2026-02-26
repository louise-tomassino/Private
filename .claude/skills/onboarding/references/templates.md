# Onboarding Templates

CLAUDE.md sections to add during onboarding. Copy and customize for each user.

---

## Onboarding Status

Add this section to CLAUDE.md at the start of onboarding. Update checkpoints as they're completed.

```markdown
## Onboarding Status

<!--
This section tracks your setup progress. Say "continue onboarding" to resume if interrupted.

After context compaction, memory hooks auto-reload recent context. Claude also re-reads this section to recover onboarding state.
After onboarding is complete, Claude will replace this section with "Learning Progress"
to track your ongoing journey with Alfred OS.
-->

**Engagement mode:** [Hands-off / Checkpoints / Guided]

### Checkpoints

- [ ] **Discovery complete** — name, location, role, household, domains, tools, goals gathered
- [ ] **Key areas structure confirmed** — subfolder organization decided
- [ ] **Separate repos decision made** — single repo / separate repos for [work/family]
- [ ] **Foundation complete** — identity, folders, labels, security, sandbox
- [ ] **Integration scope confirmed** — [Gmail / Calendar / Sheets / none]
- [ ] **Integrations connected** — [list what was connected, or "skipped"]
- [ ] **First real workflow completed** — created tasks, ran /daily, used natural commands
- [ ] **Skills introduced** — core skills explained, optional skills [explored / deferred]
- [ ] **Handoff complete** — setup reviewed, next steps shared

### Decisions Log

*Decisions made during onboarding (especially useful for Hands-off mode):*

| Checkpoint | Decision | Notes |
|------------|----------|-------|
| Key areas | | |
| Repos | | |
| Integrations | | |

---
*Current phase: [Discovery / Foundation / Integration / Training / Handoff]*
*Last updated: [date]*
```

---

## Learning Progress

Replace the Onboarding Status section with this after onboarding is complete (Phase 5, Step 5.3).

```markdown
## Learning Progress

Your journey with Alfred OS. Claude updates this as you learn new capabilities.

---

### Basics (Week 1)
*Get the system working*

- [x] System configured (categories, identity)
- [x] Created tasks in categories
- [x] Ran /daily sync
- [x] Used natural commands ("add a task", "what are my tasks")
- [ ] Ran /weekly planning
- [ ] Gmail/Calendar connected (if applicable)

---

### Intermediate (Weeks 2-4)
*Make it yours*

- [ ] Processed inbox (full workflow)
- [ ] Built something simple (app, dashboard, tool)
- [ ] Created a custom skill
- [ ] Used files vs issues intentionally (see system/guides/10-collaboration-patterns.md)
- [ ] Modified CLAUDE.md preferences based on experience

---

### Advanced (Month 2+)
*Collaborate through agents*

- [ ] Handed off a task to someone else via detailed issue
- [ ] Received a handoff and had Claude brief you
- [ ] Built and deployed a complete project
- [ ] Created skills for repeated team workflows
- [ ] Established agent-mediated collaboration patterns

---
*Current level: Basics*
*Last milestone: Onboarding complete*
*Updated: [date]*
```
