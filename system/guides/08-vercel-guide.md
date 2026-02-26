# Vercel Guide

Deploy your apps to the internet.

**You don't need this until you want to share an app with the world.**

> **You don't need to read this.** This is Claude's reference material. When you're ready to deploy, just say:
> - "Deploy this to Vercel"
> - "Help me put this online"
> - "Set up hosting for my app"
>
> Claude will guide you through deployment.

---

## What is Vercel?

A platform for hosting web apps. Free tier is generous.

- Push code to GitHub → App deploys automatically
- Get a URL like `your-app.vercel.app`
- Custom domains available

---

## When to Use Vercel

**Use Vercel when:**
- You want to share an app with others
- You need it accessible from any device
- You're building something for family/team

**Don't need Vercel for:**
- Local development
- Personal tools only you use
- Learning and experimenting

---

## First Deployment

### Step 1: Have a GitHub Repo

Your app needs to be in a GitHub repository.

If it's not:
1. Create repo on GitHub
2. Push your code (see `system/guides/07-github-guide.md`)

### Step 2: Sign Up for Vercel

1. Go to https://vercel.com
2. Sign up with GitHub
3. Authorize Vercel to access your repos

### Step 3: Import Project

1. Click "Add New Project"
2. Select your GitHub repo
3. Vercel auto-detects framework (Next.js, React, etc.)
4. Click "Deploy"

### Step 4: Wait ~1 minute

Vercel builds and deploys your app.

You get a URL: `your-app.vercel.app`

---

## Automatic Deployments

After initial setup:

1. Push code to GitHub
2. Vercel automatically rebuilds
3. New version is live in ~1 minute

No manual steps needed.

---

## Environment Variables

If your app needs secrets (API keys, etc.):

1. Go to Project Settings → Environment Variables
2. Add your variables
3. Redeploy

Example:
```
GOOGLE_CLIENT_ID=xxx
GOOGLE_CLIENT_SECRET=xxx
```

Never commit secrets to Git.

---

## Custom Domain

Want `myapp.com` instead of `myapp.vercel.app`?

1. Buy a domain (Namecheap, Google Domains, etc.)
2. In Vercel: Project Settings → Domains
3. Add your domain
4. Update DNS settings as instructed

---

## Framework Support

Vercel works great with:
- Next.js (best support, Vercel makes it)
- React
- Vue
- Svelte
- Static sites

Most things "just work" with zero configuration.

---

## Troubleshooting

**Build failed**
Check the build logs in Vercel dashboard. Usually a missing dependency or syntax error.

**Environment variable not working**
Make sure you added it to Vercel, not just locally. Redeploy after adding.

**App works locally but not on Vercel**
Check that all dependencies are in `package.json`. Vercel installs fresh.

---

## Alternatives

Vercel isn't the only option:

| Platform | Good for |
|----------|----------|
| **Vercel** | Next.js, React, most frameworks |
| **Netlify** | Similar to Vercel, good for static sites |
| **Railway** | Backend APIs, databases |
| **Fly.io** | Full control, Docker containers |

For most projects, Vercel is the easiest choice.

---

## Let Claude Help

You can tell Claude:
- "Deploy this to Vercel"
- "Set up automatic deployments"
- "Add a custom domain"

Claude can walk you through the process.

---

*You've reached the end of the guides! Go build something.*
