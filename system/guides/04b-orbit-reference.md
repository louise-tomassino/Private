# Orbit Technical Reference

Full feature reference and setup instructions for Orbit. This is Claude's reference material — users learn by asking, not by reading this doc.

For the user-facing overview, see `system/guides/04-orbit-guide.md`.

---

## Architecture

```
┌─────────────────────────────────────────────────────┐
│                   ORBIT WEB UI                      │
│         Widget Canvas (tasks, pages, markdown)      │
└─────────────────────────────────────────────────────┘
         │ fetches via GitHub API
         ▼
┌─────────────────┬────────────┬────────────┐
│     WORK        │  PERSONAL  │   FAMILY   │
│   CATEGORY      │  CATEGORY  │  CATEGORY  │
├─────────────────┼────────────┼────────────┤
│ Issues = Tasks  │ Issues =   │ Issues =   │
│ docs/ = Pages   │ Tasks      │ Tasks      │
│                 │ docs/ =    │ docs/ =    │
│                 │ Pages      │ Pages      │
└─────────────────┴────────────┴────────────┘
```

Orbit doesn't store anything itself. It's a view into GitHub repos. Configuration (category assignments, display settings) is stored in localStorage and synced via GitHub Gists for cross-device persistence.

---

## Setup

### 1. Clone the Orbit repo

The user should have been invited to the Orbit repository.

```bash
git clone [orbit-repo-url]
cd orbit
```

### 2. Install dependencies

```bash
npm install
```

### 3. Configure environment

Create `.env.local` with:
```
GITHUB_CLIENT_ID=xxx
GITHUB_CLIENT_SECRET=xxx
GITHUB_TOKEN=xxx
NEXTAUTH_SECRET=xxx
NEXTAUTH_URL=http://localhost:3000
```

See Orbit's README for how to get these values.

### 4. Run locally

```bash
npm run dev
```

Open http://localhost:3000

### 5. Configure categories

In Orbit's Settings (click avatar → Settings):
- Add `alfred` repo to the Personal category (format: `owner/alfred`)
- If separate Work or Family repos exist, add those to their categories
- Customize category colors if desired

---

## Categories

Orbit organizes repos into categories:

| Category | Purpose |
|----------|---------|
| **Work** | Professional tasks — org repos, work projects |
| **Personal** | Personal tasks — user's own repos |
| **Family** | Shared family tasks — repos shared with family members |

Categories are an **Orbit-side concept** — they're not stored in GitHub. Users configure which repos belong to each category in Settings → Repositories.

**Single repo setup:** Add `alfred` to the Personal category. Use labels (`work`, `personal`, `family`) within GitHub to further organize.

**Multi-repo setup:** Add each repo to its respective category. A category can have any number of repositories.

---

## The Widget Canvas

Orbit's UI is a widget canvas — multiple widgets visible at once, each showing different content.

### Widget Types

| Type | What it shows |
|------|---------------|
| **Tasks** | GitHub Issues from configured repos, with kanban and list views |
| **Pages** | Markdown files from repos, with folder browsing |
| **Markdown** | Custom markdown content pulled from a specific repo path |

### Canvas Controls

- **Desktop:** Multiple widgets display side-by-side horizontally
- **Mobile:** One widget at a time, with a dropdown selector in the nav bar to switch
- **Collapse/Expand:** Hover over a widget to reveal collapse (minimize) and expand buttons. Collapsed widgets show a compact 350px-wide view.
- **Edit Mode:** Toggle edit mode from Settings to see widget boundaries, drag handles, and a settings popover per widget. Drag widgets to reorder them.
- **Remove:** Hover a widget and click the X to remove it from your canvas
- **Display Modes:** Each widget can be set to `auto`, `expanded`, or `collapsed` via its settings popover in edit mode

### Default Setup

Out of the box, Orbit shows a single Tasks widget filling the screen. Add more widgets through Settings.

---

## Task Management

### Viewing Tasks
- See all tasks grouped by category (Work, Personal, Family, or All)
- Task counts shown on each category tab
- Each task shows its title, labels, assignee avatar, due date, and source repo
- Click any task to open the detail panel

### Kanban View
- Tasks displayed in columns, grouped by choice of:
  - **Priority** (triage → today → this-week → this-month → later)
  - **Status** (todo → in-progress → blocked)
  - **Assignee** (one column per person + unassigned)
- Drag-and-drop reordering within columns
- Hide/show specific columns
- Auto-hide empty columns
- Sort tasks within columns (manual, status, priority, created, alphabetical)
- Drag columns to reorder them

### Creating Tasks
- Click the "+" button to create a new task
- Select which category to add it to
- Add title, description, and optional labels
- Task inherits the current category and label filters (smart defaults)
- Task is automatically assigned to the user

### Task Detail Panel

Click any task to open a side panel with full details:
- Edit the title inline
- Edit the description (supports markdown with live preview)
- Toggle markdown checkboxes directly (e.g., `- [ ] Subtask` → `- [x] Subtask`)
- Change priority (dropdown: triage / today / this-week / this-month / later)
- Change status (dropdown: todo / in-progress / blocked)
- Set due date (date picker)
- Add/remove labels (multi-select, with inline create-new-label UI)
- Change assignee (dropdown with repo collaborators)
- View and add comments (Enter to send)
- Move task to a different category (copies to target repo, closes original with link)
- Close/reopen task
- Delete task (with confirmation)
- Open in GitHub (link)

---

## Priority System

Tasks are organized by urgency using GitHub labels:

| Priority | Label | Meaning |
|----------|-------|---------|
| **Triage** | *(auto-detected)* | Assigned by someone else, no priority set yet |
| **Today** | `today` | Must do today |
| **This Week** | `this-week` | Do this week |
| **This Month** | `this-month` | Do this month |
| **Later** | `later` | No immediate timeline |

Priority is stored as a GitHub label on the issue. The "triage" level is auto-detected — it applies when a task was assigned by someone else and has no explicit priority label.

---

## Status Tracking

Track where each task is using GitHub labels:

| Status | Label | Meaning |
|--------|-------|---------|
| **Todo** | `todo` | Not started |
| **In Progress** | `in-progress` | Currently working on |
| **Blocked** | `blocked` | Waiting on something |

---

## Due Dates

- Click the due date field in the task detail panel
- Pick a date from the calendar picker
- Due date is stored in the issue body as an HTML comment (`<!-- due: YYYY-MM-DD -->`)
- Tasks show visual indicators when overdue or due soon

---

## Filtering & Search

- **Text search** — Type to filter by title (client-side)
- **Category** — Switch between Work, Personal, Family, or All
- **Repo** — Filter to a specific repository within a category
- **Labels** — Click labels to filter (matches ANY selected label)
- **Assignee** — Filter by "me", "unassigned", or specific people (multi-select)

---

## Saved Views

Save favorite filter/sort combinations:
- Configure filters, sorting, and kanban settings
- Save as a named view (up to 20 views)
- Load a saved view with one click
- Active view indicator shows which view is loaded

---

## Display Settings

Customize what's shown (click the settings icon in the toolbar):
- Toggle label visibility on task cards
- Toggle assignee avatars on task cards
- Toggle repository names on task cards
- Choose kanban column grouping (priority / status / assignee)
- Configure sort mode within kanban columns
- Toggle auto-refresh with configurable interval

---

## Sorting

Multiple sort modes:
- **Created** — Newest first
- **Priority** — Grouped by priority level
- **Manual** — Drag-and-drop custom ordering (persisted in localStorage / Gist)

---

## Theme

Light mode, dark mode, or system preference. Toggle in the avatar menu.

---

## Moving Tasks Between Categories

1. Open the task detail panel
2. Click the category dropdown
3. Select the new category
4. Confirm the move

The task is copied to the new category's repo (with title, body, labels, and comments) and the original is closed with a "moved to" link.

---

## Comments

- View all comments in the detail panel (lazy-loaded on open)
- Add new comments (Enter to send)
- Comments are synced with GitHub Issues
- Full markdown rendering in comments

---

## Pages View

Switch to the Pages widget to work with documents:
- Browse markdown files from repos
- Smart defaults: shows `docs/` folder if it exists, otherwise the repo root
- **Alfred OS repos:** personal content lives in the numbered folders (`1-key-areas/`, `2-projects/`, `3-resources/`, `4-archive/`) and system guides are in `system/guides/`
- Navigate folders with breadcrumbs
- Alphabetical sorting (folders first, then files)
- Create new pages (modal dialog)
- Edit existing pages in the side panel
- Delete pages (with confirmation)
- Filter by category

Pages support full GitHub Flavored Markdown including code blocks with syntax highlighting, tables, and images.

---

## Markdown Widgets

Add custom markdown content as widgets:
- Source content from a specific path in a GitHub repo
- Useful for dashboards, news digests, reference material
- Configured via `_widget.json` metadata files in the repo

---

## Deploying to Vercel (Optional)

If the user wants Orbit accessible from anywhere:

1. Push to their own GitHub repo
2. Connect to Vercel
3. Configure environment variables
4. Deploy

See `system/guides/08-vercel-guide.md` for details.
