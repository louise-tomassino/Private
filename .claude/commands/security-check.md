# Monthly Security Check

Run this once a month to verify your Alfred OS setup is secure.

## Steps

### 1. Check connected MCP servers

Run `/mcp` and list all connected servers with their versions. Flag any that look unfamiliar or that you didn't set up.

### 2. Review credential files

Check that no credential files have been accidentally committed:

```bash
git ls-files | grep -iE '\.env|credentials|tokens|keys\.json|service-account'
```

If any results appear, they need to be removed from git tracking immediately.

### 3. Check file permissions

Verify credential directories have restrictive permissions:

```bash
ls -la ~/.email-mcp/ ~/.config/google/ ~/.config/google-calendar-mcp/ 2>/dev/null
```

Directories should be `drwx------` (700) — only your user can read them.

### 4. Review Google third-party app access

Remind the user to check: [Google Account → Security → Third-party apps](https://myaccount.google.com/permissions)

- Are all listed apps recognized?
- Remove any that are no longer needed

### 5. Check for Trust Mode

Check if auto-approve or trust mode is enabled. If email MCP is connected, trust mode should NOT be active — it bypasses the approval step for sending emails.

### 6. Check MCP package versions

Report the currently pinned versions from the MCP setup and check if there are newer versions available. Do NOT auto-update — just report so the user can decide.

### 7. Check sandbox status

Check if Claude Code's built-in sandbox is enabled. The sandbox restricts filesystem and network access at the OS level.

If not enabled, recommend:
- Run `/sandbox` to enable it
- This works on macOS with no additional setup
- Protects against malicious commands even if a prompt injection succeeds

### 8. Check safety hook

Verify that `.claude/settings.json` exists and references the safety hook (`.claude/hooks/safety.sh`). Also verify the hook script exists and is executable.

### 9. Check security in other repos

Look at the Task Management table in CLAUDE.md and scan `~/Projects/` for other repos with CLAUDE.md files.

For each repo found, check:
- Does `.claude/hooks/safety.sh` exist and is it executable?
- Does `.claude/settings.json` exist and reference the safety hook?
- Does CLAUDE.md contain a Security section?

Report any repos missing security files and offer to copy them from Alfred OS:
```bash
mkdir -p .claude/hooks
cp ~/Projects/alfred/.claude/hooks/safety.sh .claude/hooks/safety.sh
chmod +x .claude/hooks/safety.sh
cp ~/Projects/alfred/.claude/settings.json .claude/settings.json
```

## Present Results

Summarize findings as a checklist:

```
## Security Check - [Date]

- [ ] MCP servers: [list with versions]
- [ ] No credentials in git: ✓ / ✗
- [ ] File permissions OK: ✓ / ✗
- [ ] Google third-party apps reviewed: (remind user)
- [ ] Trust mode status: [enabled/disabled]
- [ ] MCP versions current: [list any available updates]
- [ ] Sandbox enabled: ✓ / ✗
- [ ] Safety hook active: ✓ / ✗
- [ ] Other repos secured: [list repos checked]
```

Flag any issues and suggest fixes.
