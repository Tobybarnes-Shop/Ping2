# Quick-Ping v2 -- Showcase Website Creative Brief

## Project Overview

**Product**: Quick-Ping v2 -- Sound notifications for Claude Code
**Deliverable**: A single-page showcase website that sells the experience of coding with game audio feedback
**Audience**: Developers who grew up on gaming and want their terminal to feel alive
**Goal**: Make visitors hear the site in their head before they ever install it

---

## The Big Idea

**"Your terminal has a soundtrack now."**

Quick-Ping turns every Claude Code session into a game. Git commits are item pickups. Test failures are alert stings. Context warnings escalate like MGS alert phases. The showcase site should make this *feel* inevitable -- like of course your terminal should sound like Shadow Moses.

The site does not sell a utility. It sells a vibe. The copy, the visuals, the interactions -- everything should make the visitor feel what it is like to code with Quick-Ping running. By the time they reach the install command, it should feel like they are already late to the party.

---

## Creative Direction: "Dark Ops Studio"

Three aesthetics fused into one coherent visual language:

### 1. Retro Gaming Layer (the soul)
The emotional core. MGS codec screens, Sims 2 UI chrome, PS1-era pixel artifacts, CRT scanlines as subtle texture. Not cosplay -- references. A developer who played these games will feel a quiet recognition without the site screaming "NOSTALGIA" at them.

**Key references:**
- MGS codec call screen (dark green on black, character portraits, frequency readout)
- MGS item pickup overlay (clean, centered, brief)
- Sims 2 needs/mood panels (colorful bars, expressive icons, playful status readouts)
- PS1 memory card save screen (the quiet tension of waiting)
- Game HUD elements: health bars, ammo counters, radar blips

### 2. Studio Equipment Layer (the craft)
The existing control panel already nails this: gunmetal surfaces, green LEDs, IBM Plex Mono, 4px grids. The showcase site inherits this DNA but loosens it slightly for marketing context. Think "the studio where the sounds were designed" rather than "the rack unit itself."

**Key references:**
- SSL mixing console -- dark faders, VU meters, channel strips
- Teenage Engineering OP-1 -- high-contrast OLED, playful precision
- Ableton Live session view -- dark grid, colored clips, minimal chrome
- Neve 1073 preamp -- warm steel, purposeful knobs, serious craft

### 3. Modern Dev Tools Layer (the polish)
The site needs to feel like it belongs next to Vercel, Linear, Raycast. Clean type, generous whitespace, smooth scroll, confident copy. This is the layer that prevents the retro/hardware aesthetics from feeling like a novelty project. It says: this is a real tool that real developers use.

**Key references:**
- Vercel homepage -- dramatic dark mode, code-first hero, sharp typography
- Linear landing page -- smooth scroll sections, feature spotlights, understated confidence
- Raycast -- product screenshots floating in space, keyboard-first appeal
- Warp terminal -- dark UI, developer-focused, premium feel

---

## Color Palette

### Primary Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Background | Near-black | `#0A0A0A` | Page background, deepest layer |
| Surface | Dark steel | `#141414` | Cards, panels, content blocks |
| Surface elevated | Gunmetal | `#1A1A1A` | Hover states, elevated panels |
| Border | Subtle white | `rgba(255,255,255,0.08)` | Panel edges, dividers |

### Accent System -- One color per collection theme

| Accent | Color | Hex | Context |
|--------|-------|-----|---------|
| System green | Terminal green | `#00FF41` | LEDs, active states, primary accent across the site |
| MGS amber | Codec amber | `#FFB800` | MGS collection section, alert states |
| Sims blue | Plumbob teal | `#00D4AA` | Sims collection section, playful moments |
| Danger red | Alert red | `#FF3333` | Error states, context_90 warning, the "!" moment |

### Glow Effects

Every accent color gets a corresponding glow for LED/indicator moments:
- Green glow: `0 0 12px rgba(0, 255, 65, 0.4)`
- Amber glow: `0 0 12px rgba(255, 184, 0, 0.4)`
- Teal glow: `0 0 12px rgba(0, 212, 170, 0.4)`
- Red glow: `0 0 12px rgba(255, 51, 51, 0.5)`

### Text Hierarchy

| Level | Color | Usage |
|-------|-------|-------|
| Primary | `#FFFFFF` | Headlines, key values |
| Secondary | `rgba(255,255,255,0.65)` | Body text, descriptions |
| Tertiary | `rgba(255,255,255,0.40)` | Labels, captions, metadata |
| Accent | `#00FF41` | Code snippets, commands, interactive elements |

---

## Typography

### Type System

| Role | Font | Weight | Size | Tracking | Case |
|------|------|--------|------|----------|------|
| Display (hero) | IBM Plex Mono | 700 | 56px / 3.5rem | +0.04em | Uppercase |
| Heading 1 | IBM Plex Mono | 700 | 36px / 2.25rem | +0.06em | Uppercase |
| Heading 2 | IBM Plex Mono | 700 | 24px / 1.5rem | +0.08em | Uppercase |
| Heading 3 | IBM Plex Mono | 500 | 18px / 1.125rem | +0.06em | Uppercase |
| Body | IBM Plex Mono | 400 | 16px / 1rem | normal | Sentence |
| Small / Label | IBM Plex Mono | 500 | 12px / 0.75rem | +0.08em | Uppercase |
| Micro / Badge | IBM Plex Mono | 500 | 10px / 0.625rem | +0.1em | Uppercase |
| Code | IBM Plex Mono | 400 | 14px / 0.875rem | normal | As-is |

### Type Rules
- **One font, many weights.** IBM Plex Mono only. No secondary font. Monospace is the entire personality.
- **Uppercase for all headings and labels.** This is studio equipment. Rack labels are always uppercase.
- **Generous line height for body text.** 1.6 for readability on dark backgrounds.
- **Tabular numerals everywhere.** Stats, counters, and spec values use `font-variant-numeric: tabular-nums` so numbers align in grids.

---

## Key Messaging Pillars

### Pillar 1: "Your Terminal Has a Soundtrack"
The headline promise. Coding is silent by default. Quick-Ping changes that. Every event becomes a moment. Every session has an arc.

**Supporting messages:**
- "Git commits are item pickups. Test failures are alert stings."
- "40+ events. 2 built-in collections. Your session, your soundtrack."
- "Because coding in silence was always the real bug."

### Pillar 2: "Choose Your Mission"
The collections are not just sound packs -- they are complete narrative experiences. MGS turns your session into a stealth operation. Sims turns it into a cheerful household simulation. The collection you choose defines the emotional arc of your workday.

**Supporting messages:**
- MGS: "Every session is a stealth mission. The codec rings when you start. Flow state is sneaking through Shadow Moses."
- Sims: "Your codebase is a household. Commits are promotions. Test failures get the grumpy Simlish treatment."
- "Switch collections to match your mood. Tactical Tuesday. Simlish Friday."

### Pillar 3: "Professional-Grade Control"
This is not a toy. The control panel is a proper instrument with 40+ events, per-event sound selection, AI-powered mapping, focus modes, and a REST API. The dark steel aesthetic is not decoration -- it signals serious craft.

**Supporting messages:**
- "A control panel that looks like it belongs in a recording studio."
- "AI-powered sound mapping. Drop a folder. Get instant assignments."
- "Smart mode, focus detection, CLI control. Built for how you actually work."

### Pillar 4: "Built for Claude Code"
First-class Claude Code integration. Hooks into the lifecycle. Works with agents, teams, skills. Not a generic notification system bolted on -- this is purpose-built for the Claude Code workflow.

**Supporting messages:**
- "Hooks into every Claude Code lifecycle event."
- "From session_start to context_90. Every moment accounted for."
- "Works with agents, teams, and skills out of the box."

---

## Site Structure

A single-page scroll, structured like a mission briefing that builds excitement.

### Section 1: HERO -- "Your Terminal Has a Soundtrack"
- Full-viewport dark section
- Product name "QUICK-PING" in large display type
- Tagline: "Sound notifications for Claude Code"
- Subline: "Every commit is an item pickup. Every test failure is an alert sting. Every session has an arc."
- Animated green LED pulses slowly (the site is "on")
- Two CTAs: "View on GitHub" (primary green) and "See how it works" (ghost)
- Subtle background: very faint grid pattern or scanline texture (2-3% opacity)

### Section 2: THE EXPERIENCE -- "Choose Your Mission"
- Side-by-side collection showcase cards
- **MGS Card**: Amber accent, codec-screen-inspired layout
  - "TACTICAL ESPIONAGE AUDIO" subtitle
  - Table showing the mission arc (session_start -> session_end mapped to MGS moments)
  - "124 sounds from the PS1 era"
  - Quote: "You hear *that* sound at context_90. You know the one."
- **Sims Card**: Teal accent, playful layout
  - "SIMLISH SOUND DESIGN" subtitle
  - Grid of event -> Simlish exclamation mappings
  - "140+ sounds. Every emotion covered."
  - Quote: "Your codebase is a household. Commits are promotions."
- Both cards should feel like selecting a character/mission at a game menu

### Section 3: THE CONTROL PANEL -- "Professional-Grade Control"
- Large screenshot or styled representation of the control panel UI
- Floating callout annotations pointing to key features:
  - Collection switcher dropdown
  - LED toggles per event
  - Sound preview buttons
  - Claude Suggests button
- Caption: "localhost:5050 -- Your mission control."
- Show the dark steel, green LEDs, IBM Plex Mono aesthetic in its native habitat

### Section 4: EVENT MAP -- "40+ Events. Every Moment Covered."
- Compact grid or table showing event categories
- Categories displayed as "modules" in a rack (Core, Git, Testing, Building, Context, Streaks, Time, Agent, Thinking, Skills)
- Each category shows 2-3 representative events with their descriptions
- Visual language: channel strips on a mixer, each category is a channel
- Stats bar: "40+ EVENTS / 2 COLLECTIONS / 264+ SOUNDS / ZERO BUILD STEP"

### Section 5: HOW IT WORKS -- "Three Commands. That's It."
- Clean numbered steps with code blocks:
  1. Install: `curl -fsSL ... | bash`
  2. Launch: `quick-ping-v2.sh --control-panel`
  3. Code: "Open Claude Code. Every event has a sound."
- Architecture diagram showing: Claude Code -> Hooks -> quick-ping-v2.sh -> afplay
- Technology badges: Python Flask, Vanilla JS, REST API, macOS, Zero Dependencies

### Section 6: CTA -- "Start Your Mission"
- Green-bordered panel (echo of the hero)
- Install command in a code block with copy button
- "View on GitHub" primary button
- Small print: "macOS only. Requires Python 3 and Claude Code."
- Final line: "Because coding in silence was always the real bug."

### Section 7: FOOTER
- Minimal. Project credit line. MIT License. Year.
- Design credit: "Dark ops studio aesthetic. Dieter Rams philosophy. Teenage Engineering precision."

---

## Interaction Design

### Micro-interactions
- **LED pulse**: The green LED in the hero pulses on a 3-second loop. It is the heartbeat of the page.
- **Hover states**: Cards and buttons get a subtle 1px accent border glow on hover. No dramatic transforms.
- **Code blocks**: Green text on near-black. Cursor blink animation optional.
- **Collection cards**: Subtle parallax or elevation shift on hover. The card you are looking at should feel "selected."
- **Scroll reveal**: Sections fade in gently as they enter the viewport. No bounce, no slide. Just opacity 0->1 over 400ms.

### What NOT to do
- No sound on the website itself. The irony is intentional. Let them imagine the sounds.
- No heavy animations. The aesthetic is "precision instrument" not "gaming montage."
- No emoji in headings or body copy. Emojis are for the README, not the showcase.
- No light mode toggle. This is a dark studio. The lights stay off.
- No parallax scrolling backgrounds. Keep the scroll physics native.
- No hamburger menu. It is a single page. Let them scroll.

---

## Visual Motifs

### The LED
A small, glowing green circle. Appears in the hero, next to section headings, and as toggle indicators. It is the universal "Quick-Ping is on" signal. The LED should have:
- Solid `#00FF41` fill
- Soft glow shadow: `0 0 8px rgba(0, 255, 65, 0.5)`
- Optional steel bezel ring: 2px `#4A4A4A` outline with 1px gap

### The Grid
A subtle 4px dot grid or line grid at 2-3% opacity in the background. References: PCB traces, recording studio acoustic panels, graph paper from hardware schematics. The grid should be barely visible -- a texture, not a pattern.

### The Border
Panels and cards use a single 1px border in `rgba(255,255,255,0.08)`. No border-radius. No shadows. Sharp corners everywhere. This is rack-mounted equipment. Rounded corners are for consumer products.

### The Accent Line
Section dividers and emphasis use a 2-4px left border in the accent color. Like the selection indicator on a channel strip. Used sparingly -- the green line means "pay attention here."

---

## Content Tone

### Voice
- **Confident, not boastful.** State what it does. Do not oversell.
- **Dry wit, not comedy.** "Because coding in silence was always the real bug" -- one joke per section maximum.
- **Technical, not jargony.** Speak developer. CLI commands are copy. API endpoints are features. JSON is documentation.
- **Referential, not fan-service.** Mentioning Shadow Moses once is evocative. Mentioning it five times is cosplay.

### Copy Rules
- Short paragraphs. 2-3 sentences maximum.
- Headlines are 3-7 words. All uppercase.
- Body copy is sentence case. Professional register.
- Code examples use actual Quick-Ping commands and config.
- Never use "powerful", "robust", "seamless", or "cutting-edge."
- Never use exclamation marks in headlines.
- Use em-dashes for asides. Not parentheses.

---

## Responsive Considerations

- **Desktop (1200px+)**: Full two-column layouts for collection cards. Wide event grid. Maximum whitespace.
- **Tablet (768-1199px)**: Single column. Collection cards stack. Event grid condenses to 2 columns.
- **Mobile (below 768px)**: Full single column. Code blocks scroll horizontally. Hero text sizes down to 2rem. Touch targets minimum 44px.
- The site should feel excellent at every breakpoint but be designed desktop-first. The primary audience is developers at their workstations.

---

## Deliverable Specifications

- **Format**: Single HTML file with inline CSS and minimal JS (no build step, matching Quick-Ping's own architecture)
- **Fonts**: Google Fonts link for IBM Plex Mono (400, 500, 700)
- **Images**: None required. All visual elements are CSS-generated (LEDs, borders, grids, gradients)
- **JS**: Scroll reveal animations, code copy button, smooth scroll anchors. No framework.
- **Performance**: Should load instantly. Target < 50KB total page weight excluding font files.
- **Accessibility**: WCAG AA minimum. High contrast ratios on dark background. Keyboard navigation. Semantic HTML.

---

## Summary

The Quick-Ping showcase site is a dark, precise, single-page experience that sells the feeling of coding with a soundtrack. It fuses retro gaming nostalgia (MGS, Sims 2) with professional audio equipment craft (SSL, Teenage Engineering) and modern developer tool polish (Vercel, Linear). The design is all sharp corners, green LEDs, and IBM Plex Mono. The copy is confident, dry, and developer-native. No gimmicks. No sound on the page. Just a beautifully presented argument that your terminal should not be silent.

The visitor should leave thinking: "I need this running in five minutes."
