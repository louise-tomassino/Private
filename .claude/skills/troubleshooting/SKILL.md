---
name: troubleshooting
description: "Diagnose and fix common Alfred OS setup issues. Use when: something's not working, fix my setup, debug, help it's broken, MCP not working, GitHub not working, can't create tasks, error, troubleshoot."
---

# Troubleshooting

## Core Principles

1. **Diagnose before fixing.** Run checks to understand what's actually wrong before attempting fixes.

2. **Research when stuck.** Use web search to look up error messages, documentation, and solutions. MCPs and tools evolve - the docs in this repo may be outdated.

3. **One thing at a time.** Fix issues sequentially, testing after each fix.

4. **Document what we find.** If we discover a new issue pattern, note it for future reference.

5. **Know when to escalate.** Some issues require human intervention (account access, billing, etc.).

---

## When to Use

- "Something's not working"
- "Fix my setup"
- "I'm getting an error"
- "MCP not working"
- "Can't create tasks"
- "GitHub isn't working"
- "Calendar/email not showing"
- User reports any unexpected behavior

---

## Diagnostic Flow

### Step 1: Identify the Problem Area

Ask the user: "What were you trying to do when it stopped working?"

Common problem areas:
- **Tasks/GitHub** - Can't create, view, or close tasks
- **Email (Gmail MCP)** - Can't read or send emails
- **Calendar MCP** - Can't see or create events
- **Daily/Weekly commands** - Commands not working as expected
- **General Claude issues** - Claude seems confused or lost context

---

## GitHub / Tasks Issues

### Symptoms
- "Can't create tasks"
- "Repository not found"
- "Permission denied"
- Tasks not showing up

### Diagnostic Commands

```bash
# Check if gh CLI is installed and authenticated
gh auth status

# Check if repos exist and are accessible
gh repo list --limit 10

# Test access to this repo's issues
gh issue list

# Test access to separate category repo (if configured)
# gh issue list -R [username]/[repo-name]
```

### Common Fixes

**Issue: `gh: command not found`**
```bash
# Install GitHub CLI
brew install gh  # macOS
# Then authenticate
gh auth login
```

**Issue: "Not logged in to any GitHub hosts"**
```bash
gh auth login
# Follow the prompts, choose HTTPS and browser auth
```

**Issue: Repository not found**
1. Check CLAUDE.md for the correct repo names
2. Verify repos exist: `gh repo list`
3. If missing, create them:
```bash
gh repo create [repo-name] --private
```

**Issue: Permission denied**
- User may need to re-authenticate: `gh auth refresh`
- Or the repo is owned by someone else

---

## Gmail MCP Issues

### Symptoms
- "What's in my inbox?" returns error
- "Can't read emails"
- "Gmail not connected"
- MCP errors in Claude Desktop

### Diagnostic Steps

1. **Check if MCP is installed:**
   - Open Claude Desktop settings
   - Look for "gmail" in the MCP list
   - If missing, MCP needs to be installed

2. **Check environment file exists:**
```bash
cat ~/.gmail-mcp.env
```
Should contain `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GOOGLE_REDIRECT_URI`

3. **Check for token file:**
```bash
ls -la ~/.gmail-mcp-tokens.json
```
If missing, auth flow hasn't completed.

### Common Fixes

**Issue: MCP not installed**
```bash
npx -y @anthropic-ai/claude-mcp@latest install-mcp @nicholasareed/gmail-mcp --name gmail --config '{"envFile": "~/.gmail-mcp.env"}'
```
Then restart Claude Desktop.

**Issue: Environment file missing or incomplete**
- Need to create Google Cloud credentials
- Follow `system/guides/06-mcp-setup.md` for full setup

**Issue: Token expired or invalid**
```bash
# Remove old tokens
rm ~/.gmail-mcp-tokens.json
```
Then restart Claude Desktop and re-authenticate when prompted.

**Issue: "Access blocked" during auth**
- Google Cloud app may not be configured correctly
- Check that OAuth consent screen is set up
- Ensure gmail.readonly and gmail.send scopes are added

---

## Calendar MCP Issues

### Symptoms
- "What's on my calendar?" returns error
- "Calendar not connected"
- Can't create events

### Diagnostic Steps

1. **Check if MCP is installed:**
   - Open Claude Desktop settings
   - Look for "google-calendar" in the MCP list

2. **Check environment file:**
```bash
cat ~/.google-calendar-mcp.env
```

3. **Check for token file:**
```bash
ls -la ~/.google-calendar-mcp-tokens.json
```

### Common Fixes

**Issue: MCP not installed**
```bash
npx -y @anthropic-ai/claude-mcp@latest install-mcp @cocal/google-calendar-mcp --name google-calendar --config '{"envFile": "~/.google-calendar-mcp.env"}'
```
Then restart Claude Desktop.

**Issue: Token issues**
```bash
rm ~/.google-calendar-mcp-tokens.json
```
Restart Claude Desktop and re-authenticate.

**Issue: Wrong calendar showing**
- The MCP uses the primary calendar by default
- Check which Google account was authenticated

---

## CLAUDE.md Issues

### Symptoms
- "Claude doesn't know who I am"
- "Wrong information about me"
- "Repos not showing correctly"

### Diagnostic Steps

Read current CLAUDE.md:
```bash
cat ~/Projects/alfred/CLAUDE.md
```

Check for:
- Placeholder values still present (`[PLACEHOLDER]`, `[your-username]`)
- Incorrect repo names
- Missing sections

### Common Fixes

**Issue: Still has placeholders**
- Run through onboarding again: "Continue onboarding"
- Or manually update the specific sections

**Issue: Repo names don't match actual repos**
1. List actual repos: `gh repo list`
2. Update CLAUDE.md "My Systems" section to match

---

## /daily and /weekly Not Working

### Symptoms
- Command runs but shows wrong info
- "No tasks found" when there are tasks
- Errors during command execution

### Diagnostic Steps

1. **Check if task management is configured in CLAUDE.md**
2. **Test task access:**
```bash
# Test this repo's issues
gh issue list

# Test separate repos (if configured)
# gh issue list -R [username]/[work-repo]
# gh issue list -R [username]/family
```

### Common Fixes

**Issue: CLAUDE.md has wrong repo names**
- Update the "My Systems" section with correct repo names

**Issue: No open issues**
- Create a test task: "Add a task: Test task"
- Then run /daily again

---

## Claude Desktop Issues

### Symptoms
- Claude Desktop won't open
- MCPs not loading
- Slow or unresponsive

### Common Fixes

**Issue: MCPs not loading**
1. Quit Claude Desktop completely
2. Restart Claude Desktop
3. Check MCP status in settings

**Issue: Claude seems to have lost context**
- This is normal across conversations
- CLAUDE.md provides persistent context
- Make sure CLAUDE.md is properly populated

**Issue: App crashes or freezes**
1. Force quit Claude Desktop
2. Check for updates
3. Restart the app

---

## Quick Health Check

Run this sequence to verify the system is working:

```bash
# 1. GitHub CLI working?
gh auth status

# 2. Repos accessible?
gh repo list --limit 5

# 3. Can create issues?
gh issue create --title "Health check" --body "Testing system" --label "personal"

# 4. Can list issues?
gh issue list

# 5. Can close issues?
gh issue close [issue-number]
```

If all pass, the core system is working.

For MCPs, test each:
- "What's in my inbox?" (Gmail)
- "What's on my calendar today?" (Calendar)

---

## When to Research Online

Many issues - especially with MCPs - require looking up current documentation or error messages. Use web search when:

- **Error messages are cryptic** - Search the exact error message
- **MCP behavior seems wrong** - Check the MCP's GitHub repo for issues/docs
- **Setup instructions don't match reality** - Tools update frequently; look for current docs
- **OAuth/API errors** - Google Cloud, GitHub APIs change; search for current setup guides

**Good search queries:**
- `"[exact error message]" gmail mcp`
- `google calendar mcp setup 2026`
- `gh auth login [specific error]`
- `claude desktop mcp not loading`

**Useful sources:**
- MCP GitHub repos (check Issues tab for known problems)
- Google Cloud documentation
- GitHub CLI documentation
- Claude/Anthropic documentation

---

## Escalation Paths

Some issues can't be fixed in Claude:

| Issue | Escalation |
|-------|------------|
| Google Cloud billing/access | User must handle in Google Cloud Console |
| GitHub account issues | User must handle on github.com |
| Claude Pro subscription | User must check anthropic.com/claude |
| Claude Desktop bugs | Report at github.com/anthropics/claude-code/issues |
| Network/firewall issues | User's IT department or ISP |

### Escalate to Alfred Support

If you've tried everything and the issue persists, prepare a support email to Alfred support:

**To:** janna@pennyworthstudio.com

**Email should include:**
1. **User name** - Who is experiencing the issue
2. **What they were trying to do** - The original goal
3. **What went wrong** - Error messages, unexpected behavior
4. **What was tried** - Diagnostic steps and fixes attempted
5. **Current state** - What's working, what's not

**Example:**
```
Subject: Alfred OS Support - [User Name] - [Brief Issue Description]

Hi,

[User Name] is having trouble with their Alfred OS setup. Here's what's happening:

**Issue:** Can't connect Gmail MCP - getting "invalid_grant" error

**Tried:**
- Deleted tokens file and re-authenticated
- Verified Google Cloud credentials
- Checked OAuth consent screen settings
- Searched for error online - seems related to token expiration

**Current state:**
- GitHub tasks working fine
- Calendar MCP working
- Gmail MCP fails on every auth attempt

Can you take a look when you get a chance?

Thanks!
```

Ask the user if they want to send this email, then use the email tools to send it.

---

## After Fixing

Once the issue is resolved:

1. **Test the fix** - Have user try the original action again
2. **Explain what happened** - Brief explanation helps prevent recurrence
3. **Update CLAUDE.md if needed** - If config was wrong, fix it
4. **Note patterns** - If this is a new issue, consider documenting it

---

## Process Checklist

```
[ ] Identified problem area
[ ] Ran relevant diagnostics
[ ] Found root cause
[ ] Applied fix
[ ] Tested fix works
[ ] Explained to user
[ ] Updated CLAUDE.md if needed
```
