# GitHub Guide

Git basics for when you want to deploy apps.

**You don't need this until you're ready to share an app with the world.**

> **You don't need to read this.** This is Claude's reference material. When you need Git help, just describe what you want:
> - "Commit my changes"
> - "Push to GitHub"
> - "Help me create a new repo"
>
> Claude handles the Git commands for you.

---

## When Do You Need Git?

**Don't need Git for:**
- Running apps locally
- Building personal tools
- Your Alfred OS home base (already set up)
- Learning and experimenting

**Need Git for:**
- Deploying to Vercel/Netlify
- Sharing apps with others
- Collaboration
- Version history

---

## Core Concepts

### Repository (Repo)

A folder with version history. GitHub hosts repos online.

Your Alfred OS home base is a repo. If you have separate work or family repos, those are repos too.

### Commit

A snapshot of your code at a point in time.

Like "saving" but with a description of what changed.

### Push

Upload your local commits to GitHub.

### Pull

Download commits from GitHub to your local machine.

### Branch

A parallel version of your code. Main branch is called `main`.

---

## Basic Workflow

### 1. Make Changes

Edit files, add features, fix bugs.

### 2. Stage Changes

Tell Git what to include in the next commit:

```bash
git add .
```

(The `.` means "all changes")

### 3. Commit

Save a snapshot with a description:

```bash
git commit -m "Add dashboard feature"
```

### 4. Push

Upload to GitHub:

```bash
git push
```

---

## Creating a New Repo

### Option 1: Create on GitHub first

1. Go to github.com → New Repository
2. Create repo
3. Clone to your computer:

```bash
git clone https://github.com/username/repo-name.git
cd repo-name
```

### Option 2: Start locally

1. In your project folder:

```bash
git init
```

2. Create repo on GitHub
3. Connect them:

```bash
git remote add origin https://github.com/username/repo-name.git
git push -u origin main
```

---

## Common Commands

| Command | What it does |
|---------|--------------|
| `git status` | Show what's changed |
| `git add .` | Stage all changes |
| `git commit -m "message"` | Save a snapshot |
| `git push` | Upload to GitHub |
| `git pull` | Download from GitHub |
| `git log` | See commit history |

---

## Claude Code Does Git

You rarely need to run these commands yourself.

Just tell Claude:
- "Commit my changes"
- "Push to GitHub"
- "Create a new branch for this feature"

Claude handles the details.

---

## First-Time Setup

If you've never used Git:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## Troubleshooting

**"Permission denied"**
You might need to authenticate. Use GitHub CLI:

```bash
gh auth login
```

**"Your branch is behind"**
Pull first, then push:

```bash
git pull
git push
```

**"Merge conflict"**
Files changed in both places. Claude can help resolve these.

---

*Next: Deploy to Vercel in `system/guides/08-vercel-guide.md`*
