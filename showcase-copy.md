# Quick-Ping Showcase Website Copy

---

## 1. HERO SECTION

### Headline
**Your code has a soundtrack now.**

### Tagline
Sound notifications for Claude Code. 124 Metal Gear Solid sounds. 140+ Sims 2 sounds. Every commit, every test, every context warning -- heard, not missed.

### Sub-tagline (smaller, below fold)
Because the best notification is the one you don't have to look at.

---

## 2. THE PROBLEM (Section: "The Gap")

### Headline
**You're not watching your terminal. Neither are we.**

### Body
You kicked off a Claude Code session. You switched to Slack. Or Figma. Or your phone. Ten minutes later you switch back and discover Claude finished seven minutes ago.

That's dead time. Every day.

Quick-Ping closes the loop. When Claude commits, you hear it. When tests fail, you hear it. When context hits 90% and your session is about to compress -- you *definitely* hear it.

No browser tabs. No menubar widgets. No polling. Just sound.

---

## 3. FEATURE SECTIONS

### 3A. Two Collections, Zero Configuration

**Headline:** Two iconic sound packs. Ready on install.

**Body:**
Quick-Ping ships with two built-in collections that work out of the box. No downloading sound packs, no mapping files to events, no configuration rabbit holes.

Pick a vibe. Start coding.

**MGS Collection card:**
- **124 sounds** from Metal Gear Solid (PS1)
- 8-bit mono WAV -- lo-fi, distinctive, cuts through anything
- 21 events enabled by default
- Your coding session becomes a tactical espionage operation

**Sims 2 Collection card:**
- **140+ sounds** from The Sims 2
- Simlish exclamations for every occasion
- Cheerful, warm, chaotic in the best way
- Coding feels like managing a very productive household

---

### 3B. The Control Panel

**Headline:** SSL console meets dev tools.

**Body:**
A dark steel, rack-mounted control panel for your sounds. Toggle events. Swap sounds. Preview before you commit. Search, filter, bulk enable, bulk disable.

Pure HTML/CSS/JS. No build step. Runs on localhost:5050.

**Feature bullets:**
- 40+ event types across 10 categories
- Toggle any event on or off with one click
- Swap the sound for any event via dropdown
- Preview any sound before assigning it
- Search and filter events instantly
- Bulk actions: enable all, disable all, Claude Suggests

---

### 3C. Claude Suggests

**Headline:** Let Claude pick the sounds.

**Body:**
Click one button. Claude analyzes every sound filename against every event and picks opinionated, balanced defaults. Wins get celebrated. Failures get flagged. Noisy events get muted.

Smart defaults, not busy defaults.

---

### 3D. Focus Modes

**Headline:** Smart enough to shut up.

**Body:**
**Smart Mode** only plays sounds when your terminal isn't focused. If you're already staring at the output, you don't need a ping.

**Always Mode** plays every sound, every time. For when you want the full soundtrack.

---

### 3E. Bring Your Own Sounds

**Headline:** Any folder. Any sounds. One scan.

**Body:**
Point Quick-Ping at any folder of audio files. Click "Scan Folder." Click "Claude Suggests Mappings." Save. Done.

WAV, MP3, AIFF, M4A. Your sounds, your vibe, your rules.

---

## 4. MGS NARRATIVE SECTION (Full-width, immersive)

### Headline
**Mission briefing: Your code session is now a tactical espionage operation.**

### Intro
The codec rings. Session started. You're in.

Every tool call is a radar blip -- quick, sub-second, peripheral. You're in flow state, sneaking through Shadow Moses. The sounds don't interrupt. They orient.

### The Mission Arc

Git commit? Item pickup. That satisfying chime means progress is saved.

Git push? Area transition. Intel secured, moving to the next objective.

Tests pass? You sneaked past the guards. Clean.

Tests fail? The soft "?" sting. A guard heard something. Not game over -- just a heads up.

Plan mode? You ducked into the cardboard box. Time to think.

Context at 75%? Guards are searching. Evasion phase. Wrap up or refactor.

**Context at 90%? That sound. The "!" alert. You've been spotted. Handle it now.**

PR created? Mission milestone complete. The full fanfare.

10-commit streak? Boss defeated. Top operative.

Late night coding? "Get some rest." Even Snake needs sleep.

Session ends? "Good work, Snake." Mission debrief.

### Closing
21 events enabled out of the box. Enough to feel the theme without notification fatigue. Enable more in the Control Panel for the full tactical experience.

All 124 sounds are 8-bit mono WAV from the PS1 era. The lo-fi character is the point -- distinctive, nostalgic, and sharp enough to cut through any mix.

---

## 5. SIMS 2 SECTION (Lighter, playful tone)

### Headline
**Sul sul! Your code is speaking Simlish.**

### Body
140+ sounds from The Sims 2. Cheerful celebrations when tests pass. Grumpy muttering when they don't. Enthusiastic gibberish when you push to main.

It's warm. It's chaotic. It makes a 3-hour refactoring session feel like you're just rearranging furniture in a very productive household.

The collection that started it all. If MGS is the mission, Sims is the vibes.

---

## 6. INSTALLATION SECTION

### Headline
**Three steps. Two minutes. All the sounds.**

### Step 1: Clone and install
```
git clone https://github.com/user/quick-ping-2.git
pip3 install flask flask-cors
```
Quick-Ping is pure Python + vanilla JS. No build step. No node_modules. No webpack.

### Step 2: Hook into Claude Code
Add Quick-Ping to your Claude Code hooks in `~/.claude/settings.json`. One config block, three hook points (PreToolUse, PostToolUse, Stop). Copy, paste, done.

### Step 3: Launch the Control Panel
```
./launch-control-panel.sh
```
Open localhost:5050. Pick a collection. Start coding.

### Requirements footnote
macOS (uses afplay), Python 3, Flask. That's it.

---

## 7. CALL-TO-ACTION SECTIONS

### Primary CTA (end of page)
**Headline:** Your terminal is too quiet.

**Button text:** Get Quick-Ping

**Sub-text:** Free. Open source. Two sound packs included.

---

### Secondary CTA (mid-page, after MGS section)
**Headline:** Ready for your mission briefing?

**Button text:** View on GitHub

---

### Tertiary CTA (floating/sticky)
**Button text:** Get Started

---

## 8. MICRO-COPY AND UI ELEMENTS

### Navigation labels
- Features
- Collections
- Install
- GitHub

### Collection toggle labels
- TACTICAL ESPIONAGE (MGS)
- SIMLISH CHAOS (Sims 2)

### Feature badge text
- "124 PS1 SOUNDS"
- "140+ SIMLISH SOUNDS"
- "40+ EVENTS"
- "ZERO BUILD STEP"
- "macOS"

### Tooltip / hover states
- "Hear it instead of checking for it"
- "Smart Mode: sounds only when you're away"
- "Every commit. Every test. Every warning."

### Footer tagline
Built for developers who alt-tab. Powered by nostalgia.

---

## 9. SOCIAL / SHARING COPY

### Open Graph description
Quick-Ping: Sound notifications for Claude Code. 124 Metal Gear Solid sounds and 140+ Sims 2 sounds. Every commit, test, and context warning gets its own sound. Your terminal has a soundtrack now.

### Twitter/X card
Your Claude Code sessions just got a soundtrack. Metal Gear Solid alert sounds for context warnings. Simlish celebrations for passing tests. Quick-Ping is free and open source.

---

## 10. TONE GUIDE (For the designer/developer building the site)

**Voice:** Confident, direct, slightly irreverent. We know this is a niche tool and we lean into it. No corporate hedging ("helps you potentially improve your workflow"). Just say what it does.

**Rhythm:** Short sentences. Fragments are fine. Let the copy breathe. One idea per line where possible.

**Technical credibility:** Drop specific numbers (124 sounds, 40+ events, 8-bit mono WAV, PS1 era, localhost:5050). Developers trust specifics over adjectives.

**Gaming references:** Lean in hard on MGS. "Tactical espionage" is the throughline. But keep it accessible -- you don't need to have played MGS to get the vibe. The Sims section should feel lighter and warmer.

**What to avoid:**
- "Revolutionary" / "game-changing" / "leverage" / "unlock"
- Exclamation marks (the copy should be confident, not excited)
- Lengthy paragraphs -- if it's more than 3 lines, break it up
- Explaining what sound notifications are -- the audience gets it immediately

---

## 11. PAGE FLOW SUMMARY

1. **Hero** -- headline + tagline + demo visual
2. **The Problem** -- "you're not watching your terminal"
3. **Two Collections** -- MGS card + Sims card, side by side
4. **MGS Deep Dive** -- full narrative, mission arc table, immersive
5. **Sims Section** -- lighter, playful, contrast to MGS
6. **Control Panel** -- feature bullets + screenshot
7. **Claude Suggests + Focus Modes** -- quick hits
8. **Bring Your Own Sounds** -- custom collections
9. **Installation** -- three steps
10. **Final CTA** -- "Your terminal is too quiet"
11. **Footer** -- links, tagline, credits
