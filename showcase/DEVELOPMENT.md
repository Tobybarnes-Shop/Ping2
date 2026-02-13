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

The showcase site should align with Quick-Ping's Control Panel aesthetic:

| Token | Value | Usage |
|-------|-------|-------|
| Background (dark) | `#1A1A1A` | Page background, card backgrounds |
| Background (mid) | `#2A2A2A` | Sections, panels |
| Text (primary) | `#E0E0E0` | Body text |
| Text (secondary) | `#888888` | Labels, captions |
| Accent (green) | `#00FF00` | Active states, LEDs, highlights |
| Accent (amber) | `#FFB800` | Warnings, secondary highlights |
| Font (mono) | `IBM Plex Mono` | Headlines, code, labels |
| Font (sans) | `IBM Plex Sans` or system sans-serif | Body text |
| Spacing unit | `4px` | Base grid unit (use multiples: 8, 12, 16, 24, 32) |
| Border radius | `2px` | Tight, hardware-inspired corners |

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
- [ ] Color contrast passes WCAG AA (use browser dev tools audit)
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
1. Take screenshot of the Quick-Ping Control Panel
2. Optimize (compress, crop, appropriate resolution)
3. Replace file in `assets/images/`
4. Ensure alt text is accurate

## Related Documentation

- [PROJECT.md](PROJECT.md) -- Project goals and team structure
- [DEPLOY.md](DEPLOY.md) -- Hosting and deployment details
- [decisions.md](decisions.md) -- Decision log with rationale
- Main Quick-Ping repo: `README.md`, `README-GITHUB.md`, `COLLECTIONS.md`
