# Decision Log -- Quick-Ping Showcase Site

Records key decisions made during the project, their rationale, and alternatives considered.

---

## DEC-001: Showcase site is a separate project from the main Quick-Ping repo

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Team Lead

**Context**: Quick-Ping v2.0 is a developer tool (bash scripts, Python server, config files). The showcase site is a marketing/demo page. They serve different purposes and audiences.

**Decision**: The showcase site will be developed in a `/showcase` working directory but deployed as its own repository and GitHub Pages site, separate from the main Quick-Ping tool repo.

**Rationale**:
- Different release cadences (tool vs. marketing site)
- Different deployment targets (local install vs. web hosting)
- Cleaner separation of concerns
- Showcase site has its own team workflow (creative -> copy -> design -> build -> QA)

**Alternatives considered**:
- Single repo with `/docs` folder for GitHub Pages: simpler but mixes concerns
- Subdomain of a custom domain: adds cost and DNS complexity

---

## DEC-002: Static HTML/CSS/JS with no build step

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Operations

**Context**: The showcase site needs to demo Quick-Ping with interactive sound playback. Options range from a simple HTML page to a full framework (React, Astro, Next.js).

**Decision**: Plain HTML, CSS, and JavaScript. No framework. No build step.

**Rationale**:
- Matches Quick-Ping's own architecture (control-panel.html is vanilla JS)
- Fastest path to deployment
- Zero dependency management
- GitHub Pages deploys without build configuration
- The site is a single page -- a framework would be over-engineering

**Alternatives considered**:
- Astro: Good for static sites but adds build complexity
- Next.js: Overkill for a single marketing page
- Svelte: Nice DX but unnecessary for this scope

---

## DEC-003: GitHub Pages as hosting platform

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Operations

**Context**: Need free, reliable hosting for a static showcase site.

**Decision**: GitHub Pages as primary hosting. Vercel as fallback if requirements change.

**Rationale**:
- Free, no usage limits that matter for this project
- No build configuration needed for static files
- Automatic HTTPS
- Same platform as the source code
- Simplest option for a no-build-step static site

**Alternatives considered**:
- Vercel: Better if we add a framework later. Preview deploys are nice but not essential.
- Netlify: Good feature set but adds another platform to manage.
- Self-hosted: Unnecessary complexity.

See DEPLOY.md for the full comparison matrix.

---

## DEC-004: Curated audio subset for web demos

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Operations

**Context**: The full MGS collection has 124 sounds, Sims 2 has 140+. Loading all of these for a web demo would be slow and wasteful.

**Decision**: Curate 8-12 iconic sounds per collection, convert to MP3 for web, keep total audio budget under 2MB.

**Rationale**:
- Page performance (target: LCP < 2.5s)
- Mobile data consciousness
- Only need enough sounds to sell the experience
- Full collection available after install

**Alternatives considered**:
- Stream all sounds on demand: Complex, requires more infrastructure
- Embed sounds as base64: Bloats HTML, defeats caching
- Use a CDN for full collection: Over-engineering for a demo page

---

## DEC-005: Team structure with sequential dependency chain

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Team Lead

**Context**: Building the showcase site requires creative direction, copywriting, design, development, and QA.

**Decision**: Sequential pipeline: Creative Vision (#1) -> Copy (#2) + Design (#3, blocked by #1) -> Build (#4, blocked by #2 and #3) -> QA (#5, blocked by #4). Operations (#6) runs in parallel.

**Rationale**:
- Design cannot start without creative direction
- Development needs both copy and design as inputs
- QA can only test what has been built
- Operations (documentation, deployment planning) can proceed independently

**Alternatives considered**:
- Fully parallel with more iteration: Faster start but higher rework risk
- Waterfall with sign-offs: Too formal for this project scope

---

## DEC-006: Copy tone -- confident, direct, gaming-literate

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Writer (Task #2)

**Context**: The showcase site needs a voice that appeals to developers and gamers simultaneously without alienating either.

**Decision**: Confident and direct tone. Short sentences, fragments OK. Specific numbers over adjectives. Lean hard into MGS for the tactical section, lighter and warmer for Sims. No corporate hedging. No exclamation marks.

**Rationale**:
- Target audience (Claude Code users) are technically sophisticated -- they trust specifics
- Gaming references need to feel earned, not forced
- "Vercel meets gaming culture" as a north star for tone
- The copy should feel like it was written by someone who actually uses the tool

**Key deliverable**: `showcase-copy.md` -- full copy for all 11 sections of the page

---

## DEC-007: Page structure -- 11-section single page

**Date**: 2026-02-13
**Status**: Decided
**Decider**: Writer (Task #2), aligned with Creative Director (Task #1)

**Context**: How should the showcase site be organized?

**Decision**: Single-page site with 11 sections in this order: Hero, Problem, Two Collections, MGS Deep Dive, Sims Section, Control Panel, Claude Suggests + Focus Modes, Bring Your Own Sounds, Installation, Final CTA, Footer.

**Rationale**:
- Single page keeps visitors in a narrative flow (no navigation friction)
- Structure follows classic marketing funnel: hook -> problem -> solution -> proof -> action
- MGS gets the deepest section because it has the strongest narrative (mission arc)
- Installation comes late -- sell the experience before asking for commitment

---

*Add new decisions below as they arise during the project.*
