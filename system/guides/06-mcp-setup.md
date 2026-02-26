# MCP Setup Guide

Connect Gmail, Calendar, and Sheets to Claude Code.

**Phase 3 - Optional / Self-paced**

> **You don't need to read this.** This is Claude's reference material. When you want to connect Gmail, Calendar, or Sheets, just say:
> - "Help me set up Gmail"
> - "Connect my calendar"
> - "Set up Google Sheets"
>
> Claude will walk you through it step by step using this guide.

---

## Overview

| MCP | Package | Auth Type | What it does |
|-----|---------|-----------|--------------|
| Google Calendar | `@cocal/google-calendar-mcp` | OAuth 2.0 | Read/write calendar events |
| Gmail | `@cristip73/email-mcp` | OAuth 2.0 | Read/send/archive emails |
| Google Sheets | `mcp-google-sheets` | Service Account | Read/write spreadsheets |

**Key difference:** Calendar and Gmail use OAuth (you sign in with your Google account). Sheets uses a Service Account (a "robot" account you share spreadsheets with).

---

## Prerequisites

### 1. Install required tools

```bash
# Node.js (for Calendar and Gmail MCPs)
brew install node

# Python/uv (for Sheets MCP)
brew install uv
```

### 2. Create a Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project (e.g., "Claude MCPs")
3. Note the project name — you'll need it later

---

## Where configs live

Claude Code reads MCP configs from **`~/.claude.json`**, NOT `~/.claude/mcp.json`.

Two ways to add MCPs:
- **User-level** (recommended): Available in all projects
- **Project-level**: Only in current project

```bash
# Add at user level (recommended)
claude mcp add --scope user <name> <command> --env KEY=VALUE

# Add at project level
claude mcp add <name> <command> --env KEY=VALUE
```

---

## 1. Google Calendar MCP

**Package:** [@cocal/google-calendar-mcp](https://github.com/cocal/google-calendar-mcp)

### Step 1: Install the MCP package

```bash
npm install -g @cocal/google-calendar-mcp@2.4.1
```

This installs to `/opt/homebrew/bin/google-calendar-mcp` (on Apple Silicon Macs).

### Step 2: Enable Google Calendar API

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Select your project
3. Go to **APIs & Services → Library**
4. Search for "Google Calendar API" and **Enable** it

### Step 3: Create OAuth credentials

1. Go to **APIs & Services → Credentials**
2. Click **Create Credentials → OAuth client ID**
3. Application type: **Desktop app**
4. Name it something like "Claude Calendar"
5. Click **Create**
6. **Download** the JSON file
7. Save it to: `~/.config/google/calendar-oauth.keys.json`

### Step 4: Add yourself as test user

Since the app is in "testing" mode, you need to whitelist your email:

1. Go to **APIs & Services → OAuth consent screen**
2. Click **Audience** (or scroll to "Test users")
3. Click **Add users**
4. Add all email addresses you want to connect (personal + work)

### Step 5: Authenticate your accounts

```bash
# Create config folder
mkdir -p ~/.config/google-calendar-mcp

# Authenticate personal account (stored as "normal")
GOOGLE_OAUTH_CREDENTIALS=~/.config/google/calendar-oauth.keys.json \
  npx @cocal/google-calendar-mcp auth

# Authenticate work account (stored as "work")
GOOGLE_OAUTH_CREDENTIALS=~/.config/google/calendar-oauth.keys.json \
  npx @cocal/google-calendar-mcp auth work
```

Each command opens a browser. Sign in and approve. Tokens saved to: `~/.config/google-calendar-mcp/tokens.json`

### Step 6: Add MCP to Claude Code

```bash
claude mcp add --scope user google-calendar /opt/homebrew/bin/google-calendar-mcp \
  --env GOOGLE_OAUTH_CREDENTIALS=$HOME/.config/google/calendar-oauth.keys.json
```

### Step 7: Restart Claude Code

The MCP loads on startup. Use `/mcp` command to verify it's connected.

---

## 2. Gmail MCP

**Package:** [@cristip73/email-mcp](https://github.com/cristip73/MCP-email-server)

Supports reply, archive, star/unstar, labels, and attachments.

### Step 1: Enable Gmail API

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Select your project (same one as Calendar)
3. Go to **APIs & Services → Library**
4. Search for "Gmail API" and **Enable** it

### Step 2: Copy OAuth credentials

The Gmail MCP looks for credentials in a different location, so copy them:

```bash
mkdir -p ~/.email-mcp
cp ~/.config/google/calendar-oauth.keys.json ~/.email-mcp/gcp-oauth.keys.json
```

### Step 3: Add yourself as test user

If you didn't already do this for Calendar, add your email address:

1. Go to **APIs & Services → OAuth consent screen → Audience**
2. Add the email address you want to use

### Step 4: Authenticate

```bash
npx -y @cristip73/email-mcp@0.8.0 auth
```

A browser opens. Sign in with the Google account you want to use for email.

Tokens saved to: `~/.email-mcp/credentials.json`

### Step 5: Create attachments folder

```bash
mkdir -p ~/Documents/Claude/Attachments
```

### Step 6: Add MCP to Claude Code

```bash
claude mcp add-json email-server '{"command":"npx","args":["-y","@cristip73/email-mcp@0.8.0"],"env":{"TIME_ZONE":"YOUR_TIMEZONE","DEFAULT_ATTACHMENTS_FOLDER":"'$HOME'/Documents/Claude/Attachments"}}' --scope user
```

**Note:** Replace `YOUR_TIMEZONE` with your timezone (e.g., `Europe/London`, `America/New_York`, `Asia/Tokyo`).

### Step 7: Restart Claude Code

Use `/mcp` command to verify it's connected.

### Switching Gmail accounts

To use a different account:

```bash
rm ~/.email-mcp/credentials.json
npx -y @cristip73/email-mcp@0.8.0 auth
# Restart Claude Code
```

---

## 3. Google Sheets MCP

**Package:** [mcp-google-sheets](https://pypi.org/project/mcp-google-sheets/)

Unlike Calendar and Gmail (which use OAuth), Sheets uses a **Service Account** — a "robot" account you share spreadsheets with.

### Step 1: Create a Service Account

1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Select your project
3. Go to **IAM & Admin → Service Accounts**
4. Click **Create Service Account**
5. Name: "Claude Sheets" (or anything)
6. Click **Create and Continue**
7. Skip the optional permissions, click **Done**

### Step 2: Create a key for the Service Account

1. Click on your new service account
2. Go to the **Keys** tab
3. Click **Add Key → Create new key**
4. Choose **JSON**
5. A file downloads — this is your key!
6. Save it to: `~/.config/google/sheets-service-account.json`

### Step 3: Note the service account email

The service account has an email like:
```
claude-sheets@your-project.iam.gserviceaccount.com
```

You'll need this to share spreadsheets with it.

### Step 4: Share your spreadsheets

For each spreadsheet you want Claude to access:

1. Open the spreadsheet in Google Sheets
2. Click **Share**
3. Paste the service account email
4. Give it **Editor** access (or Viewer for read-only)
5. Click **Send** (uncheck "Notify people" to skip email)

**Important:** The service account can ONLY see spreadsheets explicitly shared with it.

### Step 5: Add MCP to Claude Code

```bash
claude mcp add-json google-sheets '{"type":"stdio","command":"uvx","args":["mcp-google-sheets==0.6.0"],"env":{"GOOGLE_APPLICATION_CREDENTIALS":"'$HOME'/.config/google/sheets-service-account.json"}}' --scope user
```

### Step 6: Restart Claude Code

Use `/mcp` command to verify it's connected.

---

## What You Can Do

### Gmail

| Tool | What it does |
|------|--------------|
| `search_emails` | Find emails by query |
| `read_email` | Get full email content |
| `reply_all_email` | Reply to a thread |
| `archive_message` | Move to archive |
| `modify_labels` | Add/remove labels (including starred) |

### Google Calendar

| Tool | What it does |
|------|--------------|
| `list-events` | Get events for a time range |
| `create-event` | Create new events |
| `get-freebusy` | Check availability |
| `list-calendars` | See all calendars |

### Google Sheets

| Tool | What it does |
|------|--------------|
| `get_sheet_data` | Read spreadsheet data |
| `update_cells` | Write to cells |
| `list_sheets` | See sheets in a spreadsheet |

---

## Troubleshooting

### MCP not loading

- Run `/mcp` in Claude Code to see connected servers
- Make sure you used `claude mcp add` (not manual JSON editing)
- Restart Claude Code completely (not just reload window)

### "Access blocked" during OAuth

You need to add your email as a test user:
1. Go to **APIs & Services → OAuth consent screen → Audience**
2. Click **Add users** and add your email

### "Sheets not found" or "No access"

For Google Sheets, make sure you:
1. Shared the spreadsheet with the service account email
2. The service account email looks like `name@project.iam.gserviceaccount.com`

### Test each MCP manually

**Calendar:**
```bash
GOOGLE_OAUTH_CREDENTIALS=~/.config/google/calendar-oauth.keys.json \
  /opt/homebrew/bin/google-calendar-mcp
# Should output: "Valid tokens found for account(s): normal, work"
```

**Gmail:**
```bash
npx -y @cristip73/email-mcp@0.8.0
# Should start without errors
```

**Sheets:**
```bash
GOOGLE_APPLICATION_CREDENTIALS=~/.config/google/sheets-service-account.json \
  uvx mcp-google-sheets
# Should start without errors
```

---

## Summary: Keys & Secrets

| MCP | Auth Type | Secret File | What's in it |
|-----|-----------|-------------|--------------|
| Calendar | OAuth | `~/.config/google/calendar-oauth.keys.json` | OAuth client ID + secret (from Google Cloud) |
| Calendar | OAuth | `~/.config/google-calendar-mcp/tokens.json` | Access tokens (generated during auth) |
| Gmail | OAuth | `~/.email-mcp/gcp-oauth.keys.json` | Same as calendar (copy it) |
| Gmail | OAuth | `~/.email-mcp/credentials.json` | Access tokens (generated during auth) |
| Sheets | Service Account | `~/.config/google/sheets-service-account.json` | Service account key (from Google Cloud) |

**What you need from Google Cloud:**
1. **OAuth credentials** (one file, used by Calendar + Gmail)
2. **Service account key** (one file, used by Sheets)

---

## Files overview

```
~/.claude.json                              # MCP configurations
~/.config/google/
├── calendar-oauth.keys.json                # OAuth client credentials
└── sheets-service-account.json             # Service account key
~/.config/google-calendar-mcp/
└── tokens.json                             # Calendar auth tokens
~/.email-mcp/
├── gcp-oauth.keys.json                     # OAuth credentials (copy)
└── credentials.json                        # Gmail auth tokens
~/Documents/Claude/Attachments/             # Email attachments
```

---

## Example ~/.claude.json config

After setup, your `~/.claude.json` should have something like this in `mcpServers`:

```json
{
  "mcpServers": {
    "google-calendar": {
      "type": "stdio",
      "command": "/opt/homebrew/bin/google-calendar-mcp",
      "args": [],
      "env": {
        "GOOGLE_OAUTH_CREDENTIALS": "/Users/YOUR_USERNAME/.config/google/calendar-oauth.keys.json"
      }
    },
    "email-server": {
      "command": "npx",
      "args": ["-y", "@cristip73/email-mcp@0.8.0"],
      "env": {
        "TIME_ZONE": "YOUR_TIMEZONE",
        "DEFAULT_ATTACHMENTS_FOLDER": "/Users/YOUR_USERNAME/Documents/Claude/Attachments"
      }
    },
    "google-sheets": {
      "type": "stdio",
      "command": "uvx",
      "args": ["mcp-google-sheets==0.6.0"],
      "env": {
        "GOOGLE_APPLICATION_CREDENTIALS": "/Users/YOUR_USERNAME/.config/google/sheets-service-account.json"
      }
    }
  }
}
```

Replace `YOUR_USERNAME` with your macOS username and `YOUR_TIMEZONE` with your timezone.

---

## Security Notes

### Credential Safety

- **Never commit credentials to git** — the `.gitignore` blocks common credential files, but always double-check
- The `~/.config/google/` and `~/.email-mcp/` folders contain sensitive files — treat them like passwords
- Service account keys have the same power as passwords — anyone with the file has access

### Sensitive File Locations

These files contain your credentials. Know where they are:

| File | What it is |
|------|-----------|
| `~/.config/google/calendar-oauth.keys.json` | OAuth client credentials |
| `~/.config/google-calendar-mcp/tokens.json` | Calendar access tokens |
| `~/.email-mcp/gcp-oauth.keys.json` | Gmail OAuth client credentials |
| `~/.email-mcp/credentials.json` | Gmail access tokens |
| `~/.config/google/sheets-service-account.json` | Sheets service account key |

### If You Think Credentials Are Compromised

**Gmail or Calendar (OAuth):**
1. Go to [Google Account → Security → Third-party apps](https://myaccount.google.com/permissions)
2. Find the Claude/MCP app and click **Remove Access**
3. Delete the local token files: `rm ~/.email-mcp/credentials.json` and/or `rm ~/.config/google-calendar-mcp/tokens.json`
4. Re-authenticate: run the auth command again (see setup steps above)

**Google Sheets (Service Account):**
1. Go to [Google Cloud Console → IAM → Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts)
2. Click on your service account → Keys tab → Delete the compromised key
3. Create a new key and save it to `~/.config/google/sheets-service-account.json`

**General:**
- Changing your Google password does NOT revoke OAuth tokens — you must revoke them separately
- Revocation takes effect immediately

### Trust Mode Warning

**Do NOT use Trust Mode (YOLO Mode) when email or calendar MCP is connected.** Trust mode lets Claude act without asking permission — which means it could send emails, create calendar events, or delete messages without your approval. This removes the most important security safeguard. Only use trust mode when working on local files with no MCP servers connected.

### Version Pinning

We pin MCP server versions to prevent unexpected changes from updates. Before updating to a new version, check the changelog for any concerning changes.

---

*Next: Learn Git basics in [07-github-guide.md](07-github-guide.md)*
