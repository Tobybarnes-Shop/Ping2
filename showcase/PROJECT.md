# Quick-Ping Showcase Site -- Project Brief

## What This Is

A standalone marketing/demo website for Quick-Ping v2.0 -- a sound notification system for Claude Code. The showcase site lives separately from the main Quick-Ping repo and serves as the public face of the project.

## Goals

1. **Sell the experience** -- Make developers and gamers want to install Quick-Ping within 10 seconds of landing on the page
2. **Demo the product** -- Interactive sound previews so visitors can hear the MGS and Sims 2 collections without installing anything
3. **Drive installation** -- Clear, frictionless path from "cool" to "installed and running"
4. **Establish brand** -- Position Quick-Ping at the intersection of developer tooling and gaming culture

## Target Audience

- **Primary**: Claude Code users who want richer feedback from their coding sessions
- **Secondary**: Developer tooling enthusiasts, retro gaming fans, people who like tasteful UI
- **Tertiary**: Anyone curious about AI-assisted development workflows

## What Quick-Ping Actually Does

Quick-Ping hooks into Claude Code's event system (PreToolUse, PostToolUse, Stop) and plays sound effects for 40+ events: git commits, test results, context warnings, streaks, and more. It ships with two collections:

- **MGS Collection** (124 sounds) -- Tactical Espionage Audio. Your coding session is a Metal Gear Solid mission. Codec rings on session start, radar blips for tool use, the "!" alert at 90% context.
- **Sims 2 Collection** (140+ sounds) -- The original. Simlish exclamations for every coding occasion.

Users manage everything through a dark-steel Control Panel (localhost:5050) inspired by Teenage Engineering and Dieter Rams. Switch collections, toggle events, preview sounds, get AI-suggested mappings.

## Site Structure (Recommended)

1. **Hero** -- Hook headline + tagline + interactive sound demo
2. **Why Quick-Ping?** -- The problem (silent coding) and the solution (audio feedback)
3. **MGS Collection Feature** -- Tactical espionage narrative, mission arc table, sound previews
4. **Sims 2 Collection Feature** -- Playful Simlish angle, sound previews
5. **Control Panel Preview** -- Screenshot/mockup of the dark-steel UI
6. **Getting Started** -- Install instructions (3 steps max)
7. **Footer** -- GitHub link, credits

## Technical Constraints

- **Static site** -- No server-side rendering needed. HTML/CSS/JS only.
- **Sound playback** -- Use Web Audio API for inline sound demos
- **No build step preferred** -- Keeping it simple, like Quick-Ping itself
- **Responsive** -- Must work on mobile (people browse on phones even if they install on desktop)
- **Performance** -- Lazy-load audio assets, keep initial page weight under 500KB (excluding audio)

## Design Direction

See Task #1 (Creative Vision) for the full creative brief. Key constraints:
- Must feel like it belongs in the Quick-Ping ecosystem (dark, precise, hardware-inspired)
- Gaming culture references should feel earned, not forced
- Typography: technical/monospace primary, clean sans for body
- The site itself should feel like a well-crafted tool, not a generic marketing page

## Source Material

The showcase site should reference and draw content from these existing files in the Quick-Ping repo:

| File | What it contains |
|------|-----------------|
| `README.md` | Feature list, architecture, usage |
| `README-GITHUB.md` | GitHub-facing README with design philosophy |
| `COLLECTIONS.md` | Collections system documentation |
| `IMPLEMENTATION_SUMMARY.md` | Technical implementation details |
| `config.json` | Event definitions, collection structure |
| `control-panel.html` | The actual Control Panel UI (for screenshots/reference) |
| `sounds/MGS/` | 124 MGS sound files |
| `sounds/Sims2/` | 140+ Sims 2 sound files |

## Success Criteria

- Visitor can hear Quick-Ping sounds within 5 seconds of page load (auto-play or one-click)
- Installation path is clear and takes under 2 minutes to follow
- MGS narrative is compelling enough to make someone switch collections
- Site loads in under 2 seconds on broadband
- Works in Chrome, Safari, Firefox (latest versions)
- Passes basic accessibility audit (color contrast, keyboard nav, alt text)

## Team

| Role | Task | Status |
|------|------|--------|
| Creative Director | #1 -- Vision and design direction | Pending |
| Writer | #2 -- Copy and messaging | Pending |
| Designer | #3 -- UI mockups | Blocked by #1 |
| Developer | #4 -- Build the site | Blocked by #2, #3 |
| QA | #5 -- Testing and bug fixes | Blocked by #4 |
| Operations | #6 -- Documentation and deployment | In Progress |

## Timeline

Tasks flow sequentially through the dependency chain: Creative Vision -> Copy + Design -> Build -> QA. Operations runs in parallel throughout.
