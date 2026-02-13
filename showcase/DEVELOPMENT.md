# Development Guide -- Quick-Ping Showcase Site

Guide for building and maintaining the showcase site.

## Prerequisites

- A modern web browser (Chrome, Safari, or Firefox)
- A text editor
- `python3` (for local dev server) or any static file server
- `ffmpeg` (optional, for audio conversion)
- `git` for version control

No npm, no node_modules, no build tools required.

## Local Development

### Quick Start

```bash
# Clone the showcase site repo
git clone git@github.com:USERNAME/quick-ping-site.git
cd quick-ping-site

# Start a local server (any of these work)
python3 -m http.server 8080
# or
npx serve .
# or just open index.html directly in a browser
```

Visit http://localhost:8080

### File Structure

```
quick-ping-site/
  index.html              # The showcase page (single page)
  css/
    styles.css            # All styles
  js/
    main.js               # Page interactions, scroll effects
    audio-player.js       # Web Audio API for sound demos
  assets/
    images/               # Screenshots, icons, graphics
    sounds/
      mgs/                # Curated MGS sound samples (MP3)
      sims2/              # Curated Sims 2 sound samples (MP3)
  favicon.ico
  CNAME                   # Custom domain config (if applicable)
```

### Key Conventions

- **Single page**: Everything lives in `index.html`. No routing, no multi-page setup.
- **Vanilla JS**: No frameworks. Use modern browser APIs (Web Audio, Intersection Observer, etc.)
- **CSS custom properties**: Use variables for colors, spacing, fonts. Defined at `:root`.
- **No build step**: What you edit is what gets deployed. No compilation, no transpilation.
- **Semantic HTML**: Use appropriate elements (`<section>`, `<nav>`, `<article>`, `<button>`, etc.)

### Design System Reference

The showcase site uses a **neutral-framework** approach: the base site is clean and collection-agnostic, while each collection section gets its own distinct visual treatment.

#### Base / Neutral Tokens (used for hero, nav, footer, install section, control panel preview)

| Token | Value | Usage |
|-------|-------|-------|
| Background (dark) | `#1A1A1A` | Page background |
| Background (mid) | `#2A2A2A` | Sections, panels |
| Text (primary) | `#E0E0E0` | Body text |
| Text (secondary) | `#888888` | Labels, captions |
| Accent (neutral) | `#FFFFFF` or subtle blue | CTAs, links, interactive elements |
| Font (mono) | `IBM Plex Mono` | Headlines, code, labels |
| Font (sans) | `IBM Plex Sans` or system sans-serif | Body text |
| Spacing unit | `4px` | Base grid unit (use multiples: 8, 12, 16, 24, 32) |
| Border radius | `2px` | Tight, hardware-inspired corners |

#### MGS Collection Section Tokens

| Token | Value | Usage |
|-------|-------|-------|
| Background | `#0A0A0A` to `#1A1A1A` | Dark, tactical feel |
| Accent (primary) | `#00FF00` | Radar green, LEDs, active states |
| Accent (secondary) | `#FFB800` | Amber alerts, warnings |
| Text highlight | `#00FF00` | Key phrases, event names |
| Vibe | Dark, tactical, military | Espionage briefing aesthetic |

#### Sims 2 Collection Section Tokens

| Token | Value | Usage |
|-------|-------|-------|
| Background | `#F0F8F0` to `#E8F5E9` | Light, warm, playful |
| Accent (primary) | `#00BFA5` | Teal / plumbob green |
| Accent (secondary) | `#4CAF50` | Sims-style green |
| Text (primary) | `#2D2D2D` | Dark text on light background |
| Text highlight | `#00BFA5` | Key phrases, event names |
| Vibe | Light, warm, chaotic-friendly | Simlish household energy |

**Important**: The visual transition between the MGS and Sims 2 sections should be deliberate and dramatic. The contrast between dark-tactical and light-playful IS the product's value proposition -- it shows that Quick-Ping adapts to your mood.

#### Control Panel Theming (Product Feature)

The Quick-Ping Control Panel (`control-panel.html`) itself now supports collection-aware themes. This is a product feature, not just a showcase site concern.

**How it works**: The control panel uses CSS custom properties (`:root` variables defined at the top of the `<style>` block). A second theme is defined via `[data-theme="sims"]` selector overriding the same variables. The `switchCollection()` function (around line 1689) toggles `data-theme` on the `<html>` element when collections change.

**Theme mapping:**
- `active_collection === "mgs"` or default: Dark theme (current, no `data-theme` attribute)
- `active_collection === "default"` (Sims 2): Light theme (`data-theme="sims"`)

**Showcase site implication**: The site should include side-by-side screenshots or mockups of both Control Panel themes. This is a key selling point -- "even the UI adapts to your collection."

**Key CSS variables that change between themes:**

| Variable | MGS (Dark) | Sims (Light) |
|----------|-----------|--------------|
| `--color-bg-primary` | `#1A1A1A` | `#F5F5F5` (or similar light) |
| `--color-bg-panel` | `#151515` | `#FFFFFF` |
| `--color-text-primary` | `#FFFFFF` | `#2D2D2D` |
| `--color-led-on` | `#00FF00` | Dayglow / teal / plumbob green |
| `--color-border` | `rgba(255,255,255,0.1)` | `rgba(0,0,0,0.1)` |

Full Sims theme token values TBD by creative director.

#### Sound Description Labels (Product Feature)

Each event in config.json now includes a `sound_description` field that tells users what the sound IS before they press play. This is especially important for the MGS collection where filenames are hex codes (e.g., "0x01.wav" tells you nothing, but "Alert (!)" tells you everything).

**Config structure:**
```json
{
  "session_start": {
    "description": "When Claude Code session starts",
    "enabled": true,
    "sound": "0x1a.wav",
    "sound_description": "Codec ring"
  }
}
```

**UI location**: In `createEventCard()` (line 1228 of control-panel.html), the description displays beneath the sound select dropdown. Styled as a secondary label -- small, muted, informational.

**Key MGS descriptions for reference:**

| Event | Sound File | Description |
|-------|-----------|-------------|
| session_start | 0x1a.wav | Codec ring |
| context_90 | 0x01.wav | Alert (!) |
| git_commit | 0x67.wav | Item pickup chime |
| git_push | 0x09.wav | Area transition |
| test_pass | 0x73.wav | Sneak success |
| test_fail | 0x15.wav | Guard alert (?) |
| plan_mode_enter | 0x40.wav | Cardboard box |
| git_pr_create | 0x44.wav | Mission milestone |
| streak_10 | 0x5D.wav | Boss defeated |
| subagent_start | 0x06.wav | Codec frequency dial |

**Key Sims 2 descriptions for reference:**

| Event | Sound File | Description |
|-------|-----------|-------------|
| session_start | mGREETING.wav | Cheerful greeting |
| git_commit | Good Shot M.wav | Enthusiastic approval |
| git_error | Bad Shot M.wav | Disappointed grumble |
| git_pr_create | fCELEB0.wav | Celebration |
| late_night | mTIRED.wav | Sleepy yawn |
| context_75 | fHUNGRY.wav | Hungry complaint |
| permission | fWAITING0.wav | Impatient waiting |
| plan_mode_enter | mBENCH0.wav | Sitting down to think |

**Showcase site implication**: The demo sections can use these descriptions as labels in the interactive sound preview grid, making the page more informative even before visitors click play.

### Sound Demo Implementation

Use the Web Audio API for interactive sound previews:

```javascript
// Basic audio player pattern
const audioContext = new (window.AudioContext || window.webkitAudioContext)();

async function playSound(url) {
  const response = await fetch(url);
  const arrayBuffer = await response.arrayBuffer();
  const audioBuffer = await audioContext.decodeAudioData(arrayBuffer);
  const source = audioContext.createBufferSource();
  source.buffer = audioBuffer;
  source.connect(audioContext.destination);
  source.start(0);
}

// Must be triggered by user interaction (click/tap) due to browser autoplay policies
document.querySelector('.play-btn').addEventListener('click', () => {
  playSound('/assets/sounds/mgs/alert.mp3');
});
```

Note: Browsers require user interaction before playing audio. Design the demo to encourage a click/tap before any sound plays.

### Audio File Preparation

To convert WAV files from the Quick-Ping repo to web-friendly MP3:

```bash
# Convert single file
ffmpeg -i input.wav -codec:a libmp3lame -b:a 128k output.mp3

# Batch convert a folder
for f in *.wav; do
  ffmpeg -i "$f" -codec:a libmp3lame -b:a 128k "${f%.wav}.mp3"
done
```

Curated sounds to include (suggested -- final list depends on Creative Director):

**MGS Collection picks:**
- `0x01.wav` -- The "!" alert (most iconic)
- `0x1a.wav` -- Codec call (session start)
- `0x67.wav` -- Item pickup (git commit)
- `0x06.wav` -- Codec frequency dial
- `0x40.wav` -- Cardboard box moment
- `0x44.wav` -- Mission milestone
- `0x4F.wav` -- Radar blip (frequent tool use)
- `0x73.wav` -- Sneak success (tests pass)

**Sims 2 Collection picks:**
- A greeting sound (session start)
- A celebration sound (git commit)
- A frustrated sound (test failure)
- A cheerful exclamation (test pass)
- (Exact filenames TBD based on curation)

### Testing

No test framework. Manual testing checklist:

- [ ] Page loads without console errors
- [ ] All sound demos play on click
- [ ] Sound demos work after first user interaction (autoplay policy)
- [ ] Page is responsive at 320px, 768px, 1024px, 1440px viewports
- [ ] All links work
- [ ] Images load and have alt text
- [ ] Keyboard navigation works (Tab through all interactive elements)
- [ ] Color contrast passes WCAG AA in neutral sections (use browser dev tools audit)
- [ ] Color contrast passes WCAG AA in MGS section (green/amber on dark)
- [ ] Color contrast passes WCAG AA in Sims section (teal on light)
- [ ] Visual transition between MGS and Sims sections is clean and deliberate
- [ ] Page weight is under 500KB (excluding lazy-loaded audio)

### Browser Testing

Test in the latest versions of:
- Chrome / Edge (Chromium)
- Safari (macOS and iOS)
- Firefox

### Performance

- Inline critical CSS if needed (probably not for a single-page site)
- Lazy-load images below the fold with `loading="lazy"`
- Lazy-load audio files (don't fetch until user scrolls to demo section or clicks play)
- Optimize images: use WebP with PNG/JPG fallbacks, compress aggressively
- Keep total JS under 50KB (should be easy with vanilla JS)

## Deployment

See [DEPLOY.md](DEPLOY.md) for the full deployment plan.

Quick version:
```bash
git add .
git commit -m "Update showcase site"
git push origin main
# GitHub Pages deploys automatically
```

## Content Updates

### Updating copy
Edit the text directly in `index.html`. All copy lives inline -- no CMS, no content files.

### Adding sounds
1. Convert to MP3 (see Audio File Preparation above)
2. Add to `assets/sounds/mgs/` or `assets/sounds/sims2/`
3. Update the JS to reference the new file
4. Test playback

### Updating screenshots
The showcase site needs screenshots of BOTH Control Panel themes:
1. Take screenshot with MGS collection active (dark theme)
2. Take screenshot with Sims 2 collection active (light theme)
3. Optimize (compress, crop, appropriate resolution)
4. Replace files in `assets/images/`
5. Ensure alt text specifies which theme is shown

## Related Documentation

- [PROJECT.md](PROJECT.md) -- Project goals and team structure
- [DEPLOY.md](DEPLOY.md) -- Hosting and deployment details
- [decisions.md](decisions.md) -- Decision log with rationale
- Main Quick-Ping repo: `README.md`, `README-GITHUB.md`, `COLLECTIONS.md`
