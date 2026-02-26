# Organizing Your Information

How to use the four numbered folders in Alfred OS to keep your life organized.

---

## The Four Folders

Your information lives in four numbered folders. The numbers keep them in a logical order when you look at the file list.

### 1-key-areas/ — Ongoing Parts of Your Life or Business

Things that never really "finish." They're always there.

**Personal examples:** health, finances, household, career, relationships, hobbies
**Business examples:** marketing, operations, strategy, people, finances

**How to know it's a key area:** Ask "Does this have an end date?" If no, it's a key area.

### 2-projects/ — Active Initiatives

Things you're working on that have a goal and an endpoint. When you're done, they move to archive.

**Examples:** "plan summer trip", "renovate kitchen", "learn Spanish", "write business plan"

**How to know it's a project:** Ask "Will this be done at some point?" If yes, it's a project.

### 3-resources/ — Reference Material

Things you look up but don't actively work on. Information you want to find later.

**Examples:** contacts, restaurant recommendations, product research, how-to guides, saved articles

The `digests/` subfolder is where email newsletter summaries get saved during inbox processing.

**How to know it's a resource:** Ask "Am I saving this to look it up later?" If yes, it's a resource.

### 4-archive/ — Done or Inactive

Completed projects, old plans, things you no longer need front and center but might want to find someday.

**When to archive:** When a project is done or a key area becomes irrelevant.

---

## Getting Started

Start simple. During onboarding, you chose a few key area subfolders based on your life domains. That's all you need to begin.

You don't need to organize everything on day one. Create folders and files as you need them. The structure grows with you.

**Common starting setup:**
```
1-key-areas/
├── health/
├── finances/
└── household/
2-projects/        (empty until you start something)
3-resources/       (empty until you save something)
4-archive/         (empty until you finish something)
```

---

## Common Questions

### Where does X go?

| Situation | Folder | Why |
|-----------|--------|-----|
| My gym routine | 1-key-areas/health/ | Ongoing, no end date |
| Marketing plan | 1-key-areas/marketing/ | Ongoing business domain |
| Plan a birthday party | 2-projects/ | Has a clear endpoint |
| Restaurant list for visitors | 3-resources/ | Reference you look up |
| Last year's tax return | 4-archive/ | Done, kept for records |
| Doctor's contact info | 3-resources/ (or 1-key-areas/health/) | Either works |
| Notes from a course I finished | 4-archive/ | Done |
| Notes from a course I'm taking | 2-projects/ | Active, has endpoint |
| My monthly budget template | 1-key-areas/finances/ | Ongoing reference |
| Research on which car to buy | 2-projects/ (or 3-resources/) | Active decision-making |

### What if something fits two folders?

Pick one. There's no wrong answer. The point is that you can find it, not that it's in the "right" place. Claude can search across all folders anyway.

### How does this work across repos?

All repos (personal, family, work) use the same four-folder pattern:
```
any-repo/
├── 1-key-areas/
├── 2-projects/
├── 3-resources/
└── 4-archive/
```

This means the system works the same way everywhere. Once you learn it in one place, it works in all of them.

---

## Growing Over Time

As you use the system, you'll naturally:
- Add more subfolders inside key areas (e.g., `1-key-areas/career/networking/`)
- Create project folders for new initiatives
- Build up a library of resources
- Move finished projects to archive

Don't plan this ahead. Let it happen organically. When something feels cluttered or hard to find, that's when you add structure.

### Adding New Key Areas

When a new domain becomes important in your life or business, create a subfolder:
```
1-key-areas/fitness/       # Started going to the gym
1-key-areas/side-project/  # New ongoing commitment
1-key-areas/people/        # Business: customers, partners, team
```

### Tracking People

If you work with clients, partners, or other people you interact with regularly, `1-key-areas/people/` gives you a lightweight CRM. Each person gets their own folder with a profile, a running activity log, and numbered files for significant interactions.

See `system/guides/managing-people.md` for the full pattern.

### When Projects Finish

Move them to archive with a date prefix so you can find them later:
```
4-archive/2026-02-summer-trip/
4-archive/2026-01-kitchen-renovation/
```

### Keeping Resources Useful

Resources work best when they're organized by topic:
```
3-resources/
├── contacts/
├── travel/
├── recipes/
└── digests/          # Email summaries (auto-generated)
```

---

## The Auto-Updating Index

Your repo has a file called `INDEX.md` at the root. It lists every document you've created across all four folders, along with its title.

**You don't need to maintain it.** It updates itself automatically whenever Claude creates or edits a file. Claude reads this index so it always knows what you have — even as your folders grow to hundreds of documents.

If you're curious, open `INDEX.md` and take a look. But you never need to edit it yourself.

---

*This is your system. Adjust it to fit how you think, not the other way around.*
