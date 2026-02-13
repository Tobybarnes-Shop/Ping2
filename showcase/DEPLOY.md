# Deployment Plan -- Quick-Ping Showcase Site

## Recommendation: GitHub Pages

**Primary recommendation: GitHub Pages** with Vercel as backup option.

### Why GitHub Pages

| Factor | GitHub Pages | Vercel | Netlify |
|--------|-------------|--------|---------|
| Cost | Free | Free tier | Free tier |
| Custom domain | Yes (CNAME) | Yes | Yes |
| HTTPS | Automatic | Automatic | Automatic |
| Deploy from | git push to branch | git push / CLI | git push / CLI |
| Build step | Optional (Jekyll or none) | Required (framework detection) | Required (build command) |
| Complexity | Minimal | Medium | Medium |
| CDN | Fastly | Edge network | Cloudflare |
| Bandwidth | 100GB/month soft limit | 100GB/month free | 100GB/month free |
| Best for | Static HTML/CSS/JS | Framework-based apps | JAMstack sites |

**GitHub Pages wins because:**

1. **No build step** -- Quick-Ping's showcase is static HTML/CSS/JS, like the Control Panel itself. Push and done.
2. **Same platform** -- The Quick-Ping repo already lives on GitHub. One fewer account/service to manage.
3. **Simplicity** -- No config files, no build commands, no framework detection. Just HTML files served from a branch.
4. **Free forever** -- No usage-based pricing surprises. The showcase site will never exceed GitHub Pages limits.

### When to use Vercel instead

Choose Vercel if:
- We add a framework (Next.js, Astro) for the showcase site
- We need server-side rendering or API routes
- We want preview deployments on every PR
- We need edge functions for analytics or A/B testing

### When to use Netlify instead

Choose Netlify if:
- We need form handling (contact forms, feedback)
- We want Netlify CMS for content management
- We need split testing or branch deploys with UI

## GitHub Pages Setup

### Option A: Separate Repository (Recommended)

Create a new repo `quick-ping-site` (or similar) with its own deployment:

```bash
# Create the showcase site repo
gh repo create quick-ping-site --public --description "Quick-Ping showcase website"

# Push the site files
cd showcase/
git init
git add .
git commit -m "Initial showcase site"
git remote add origin git@github.com:USERNAME/quick-ping-site.git
git push -u origin main

# Enable GitHub Pages
gh api repos/USERNAME/quick-ping-site/pages \
  --method POST \
  --field source='{"branch":"main","path":"/"}'
```

**Pros**: Clean separation. Showcase site has its own commit history, issues, and deploy pipeline.
**Cons**: Two repos to manage.

### Option B: Subdirectory in Main Repo

Deploy from a `/docs` or `/showcase` directory in the quick-ping-2 repo:

```
Settings > Pages > Source: Deploy from a branch
Branch: main
Folder: /showcase (or /docs)
```

**Pros**: Single repo, everything together.
**Cons**: Showcase commits mixed with tool commits. Deploy triggers on any push to main.

### Recommendation: Option A (Separate Repo)

The showcase site is a different project with different concerns (marketing, design, copy). It should have its own lifecycle.

## Directory Structure

```
quick-ping-site/
  index.html              # Main showcase page
  css/
    styles.css            # Site styles
  js/
    main.js               # Interactions and sound playback
    audio-player.js       # Web Audio API wrapper for demos
  assets/
    images/               # Screenshots, mockups, icons
    sounds/               # Selected sound samples for web preview
      mgs/                # Curated MGS sounds (small subset)
      sims2/              # Curated Sims 2 sounds (small subset)
  favicon.ico
  CNAME                   # Custom domain (if applicable)
  README.md               # Repo README
```

## Audio Asset Strategy

The full sound collections are too large for a web demo. Strategy:

1. **Curate a subset** -- Pick 8-12 most iconic sounds per collection for web preview
2. **Convert to web format** -- Use MP3 or OGG for smaller file sizes (WAV is too large for web)
3. **Lazy load** -- Don't load audio until user interacts with the demo section
4. **Total audio budget** -- Keep all web audio under 2MB total

Conversion command:
```bash
# Convert WAV to MP3 (128kbps, good enough for short notification sounds)
for f in *.wav; do
  ffmpeg -i "$f" -codec:a libmp3lame -b:a 128k "${f%.wav}.mp3"
done
```

## Custom Domain (Optional)

If a custom domain is desired:

1. Purchase domain (e.g., `quickping.dev` or `quick-ping.dev`)
2. Add CNAME file to repo root with domain name
3. Configure DNS:
   - A records pointing to GitHub Pages IPs (185.199.108-111.153)
   - Or CNAME record pointing to `USERNAME.github.io`
4. Enable HTTPS in repo Settings > Pages

## Deployment Checklist

### Pre-Deploy
- [ ] All HTML validates (W3C validator)
- [ ] CSS is minified (or small enough not to matter)
- [ ] Images are optimized (WebP where possible, compressed PNG/JPG fallbacks)
- [ ] Audio files converted to web-friendly formats
- [ ] All links work (no broken hrefs)
- [ ] Favicon in place
- [ ] Meta tags set (title, description, og:image for social sharing)
- [ ] Responsive design tested on mobile viewports
- [ ] Accessibility audit passes (contrast, keyboard nav, screen reader)

### Deploy
- [ ] Push to main branch
- [ ] Verify GitHub Pages build succeeds (Actions tab)
- [ ] Test live URL in Chrome, Safari, Firefox
- [ ] Test sound playback on live site
- [ ] Verify HTTPS works

### Post-Deploy
- [ ] Update main Quick-Ping repo README with link to showcase site
- [ ] Share URL for team review
- [ ] Check Google PageSpeed Insights score
- [ ] Set up basic analytics if desired (Plausible, Simple Analytics -- privacy-respecting)

## Performance Targets

| Metric | Target |
|--------|--------|
| First Contentful Paint | < 1.5s |
| Largest Contentful Paint | < 2.5s |
| Total page weight (no audio) | < 500KB |
| Total page weight (with audio) | < 3MB |
| Lighthouse Performance | > 90 |
| Lighthouse Accessibility | > 95 |

## Monitoring

GitHub Pages provides no built-in analytics. Options:

1. **None** -- Simplest. If we don't need metrics, skip it.
2. **Plausible Analytics** -- Privacy-respecting, lightweight (~1KB script). Paid service ($9/mo).
3. **Simple Analytics** -- Similar to Plausible. Paid.
4. **GoatCounter** -- Free and open source. Self-hosted or hosted tier.
5. **GitHub traffic** -- Repo Insights > Traffic shows visits (only for repo owners, 14-day window).

**Recommendation**: Start with no analytics. Add GoatCounter if we want to track visits later.
