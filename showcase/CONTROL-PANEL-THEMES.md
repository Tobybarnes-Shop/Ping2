# Control Panel Theme Specifications

**Version**: 1.0
**Date**: 2026-02-13
**Purpose**: Design spec for collection-adaptive theming in control-panel.html

The control panel adapts its entire visual language based on the active sound collection. When MGS is active, the UI is dark, tactical, and industrial. When Sims 2 is active, the UI flips to a light, warm, playful interface with dayglow accents. The transformation should feel total -- not just a color swap but a mood shift.

---

## Theme Architecture

### How It Works

1. The `<html>` element gets a `data-theme` attribute: `"mgs"` or `"sims"`
2. All CSS custom properties are redefined under `[data-theme="sims"]`
3. Theme switches when `switchCollection()` is called
4. Transition: `background 300ms ease, color 300ms ease, border-color 300ms ease` on body

```javascript
// In switchCollection(), after setting activeCollection:
document.documentElement.setAttribute('data-theme',
  collectionId.includes('sims') ? 'sims' : 'mgs'
);
```

### Default Theme

If `data-theme` is absent or the collection is unrecognized, default to the MGS (dark) theme. This matches the current control panel and is the safest fallback for custom/unknown collections.

---

## Theme 1: MGS (Dark) -- "Tactical Operations Console"

This IS the current control panel design. No changes needed to the existing CSS. The specs below document it as a named theme for clarity.

### Design Tokens (MGS)

```css
:root,
[data-theme="mgs"] {
  /* Backgrounds */
  --color-bg-primary:     #1A1A1A;
  --color-bg-panel:       #151515;
  --color-bg-meter:       #0D0D0D;
  --color-bg-category:    #2A2A2A;

  /* Text */
  --color-text-primary:   #FFFFFF;
  --color-text-secondary: rgba(255, 255, 255, 0.65);
  --color-text-tertiary:  rgba(255, 255, 255, 0.45);

  /* Accent */
  --color-accent:         #D63500;
  --color-accent-dim:     rgba(214, 53, 0, 0.15);
  --color-accent-hover:   #E53500;

  /* Borders */
  --color-border:         rgba(255, 255, 255, 0.10);
  --color-border-heavy:   rgba(255, 255, 255, 0.15);

  /* LEDs */
  --color-led-on:         #00FF00;
  --color-led-off:        rgba(255, 255, 255, 0.10);
  --color-led-bezel:      #4A4A4A;
  --color-led-glow:       0 0 4px #00FF00, 0 0 8px #00FF00;

  /* Interactive */
  --color-btn-bg:         #1A1A1A;
  --color-btn-hover:      #151515;
  --color-input-bg:       #1A1A1A;
  --color-toast-bg:       #252525;
  --color-toast-border:   #D63500;
  --color-modal-overlay:  rgba(0, 0, 0, 0.75);
  --color-modal-bg:       #151515;

  /* Progress */
  --color-progress-track: rgba(255, 255, 255, 0.10);
  --color-progress-fill:  #00FF00;

  /* Shadows (dark theme has subtle inner shadows) */
  --shadow-switch:        inset 0 1px 2px rgba(0, 0, 0, 0.5);
  --shadow-card:          none;
}
```

### Visual Character

- Dark steel surfaces
- Green LED indicators with glow
- Red/orange accent (#D63500) for primary actions
- Dense information layout
- Military-grade readout feel
- Feels like: a mixing console in a dark recording studio

---

## Theme 2: Sims (Light) -- "Plumbob Living Room"

A complete inversion. White/cream backgrounds, soft shadows instead of borders, teal/green dayglow accents. The same functional layout but dressed in Sims 2 suburban comfort.

### Design Tokens (Sims)

```css
[data-theme="sims"] {
  /* Backgrounds -- Light, clean, slightly warm */
  --color-bg-primary:     #F5F5F0;    /* Warm off-white */
  --color-bg-panel:       #FFFFFF;    /* Pure white panels */
  --color-bg-meter:       #ECEEE8;    /* Soft warm gray for insets */
  --color-bg-category:    #E8F5F0;    /* Very pale teal tint */

  /* Text -- Dark on light */
  --color-text-primary:   #1A2A24;    /* Near-black with green undertone */
  --color-text-secondary: rgba(26, 42, 36, 0.65);
  --color-text-tertiary:  rgba(26, 42, 36, 0.40);

  /* Accent -- Plumbob teal-green (the diamond above Sims' heads) */
  --color-accent:         #00B389;    /* Plumbob green, slightly darker for contrast on white */
  --color-accent-dim:     rgba(0, 179, 137, 0.10);
  --color-accent-hover:   #009E79;

  /* Borders -- Softer, visible on light backgrounds */
  --color-border:         rgba(0, 0, 0, 0.08);
  --color-border-heavy:   rgba(0, 0, 0, 0.15);

  /* LEDs -- Dayglow plumbob green */
  --color-led-on:         #00D4AA;    /* Bright teal/plumbob */
  --color-led-off:        rgba(0, 0, 0, 0.08);
  --color-led-bezel:      #B0B8B4;    /* Light gray bezel (inverted from dark theme) */
  --color-led-glow:       0 0 4px #00D4AA, 0 0 8px rgba(0, 212, 170, 0.4);

  /* Interactive */
  --color-btn-bg:         #FFFFFF;
  --color-btn-hover:      #F0F5F3;
  --color-input-bg:       #FFFFFF;
  --color-toast-bg:       #FFFFFF;
  --color-toast-border:   #00B389;
  --color-modal-overlay:  rgba(0, 0, 0, 0.30);   /* Lighter overlay */
  --color-modal-bg:       #FFFFFF;

  /* Progress */
  --color-progress-track: rgba(0, 0, 0, 0.06);
  --color-progress-fill:  #00D4AA;

  /* Shadows (light theme uses subtle box shadows instead of relying on borders) */
  --shadow-switch:        inset 0 1px 2px rgba(0, 0, 0, 0.08);
  --shadow-card:          0 1px 3px rgba(0, 0, 0, 0.06);
}
```

### Visual Character

- Clean white/cream surfaces
- Plumbob teal-green LEDs and accents
- Soft shadows replace harsh borders
- More visual breathing room
- Warm, domestic, cheerful energy
- Feels like: the Sims 2 UI build mode panel -- clean, bright, approachable

### Component Adaptations (Sims Theme)

The following notes clarify where the Sims theme needs special handling beyond token swaps:

#### Header Panel

```css
[data-theme="sims"] .header {
  background: var(--color-bg-panel);
  border-color: var(--color-border);
  box-shadow: var(--shadow-card);
}
```

#### Event Cards

```css
[data-theme="sims"] .event-card {
  background: var(--color-bg-panel);
  border-color: var(--color-border);
  box-shadow: var(--shadow-card);
}

/* On light bg, disabled cards use lower opacity */
[data-theme="sims"] .event-card.disabled {
  opacity: 0.5;
}
```

#### LED Strip (Top of Event Card)

The LED strip at the top of each card changes to teal:

```css
[data-theme="sims"] .event-card:not(.disabled) .event-led-strip {
  background: var(--color-led-on);          /* #00D4AA */
  box-shadow: 0 0 4px var(--color-led-on);
}
```

#### Switch (Toggle) LED

```css
[data-theme="sims"] .switch {
  background: var(--color-bg-meter);
  border-color: var(--color-led-bezel);
  box-shadow: var(--shadow-switch);
}

[data-theme="sims"] .switch.active::after {
  background: var(--color-led-on);          /* #00D4AA instead of #00FF00 */
  box-shadow: var(--color-led-glow);
}
```

#### Category Headers

```css
[data-theme="sims"] .category-header {
  background: var(--color-bg-category);     /* Pale teal tint */
  border-color: var(--color-border);
  color: var(--color-text-primary);
}
```

#### Buttons

```css
[data-theme="sims"] .btn {
  background: var(--color-btn-bg);
  color: var(--color-text-primary);
  border-color: var(--color-border);
}

[data-theme="sims"] .btn:hover {
  background: var(--color-btn-hover);
  border-color: var(--color-border-heavy);
}

[data-theme="sims"] .btn-primary {
  background: var(--color-accent);          /* Plumbob green */
  color: #FFFFFF;
  border-color: var(--color-accent);
}

[data-theme="sims"] .btn-primary:hover {
  background: var(--color-accent-hover);
  border-color: var(--color-accent-hover);
}
```

#### Select Dropdowns and Inputs

```css
[data-theme="sims"] .sound-select,
[data-theme="sims"] .search-box,
[data-theme="sims"] .form-input,
[data-theme="sims"] .collection-select {
  background: var(--color-input-bg);
  color: var(--color-text-primary);
  border-color: var(--color-border);
}

[data-theme="sims"] .search-box::placeholder,
[data-theme="sims"] .form-input::placeholder {
  color: var(--color-text-tertiary);
}

[data-theme="sims"] .sound-select:focus,
[data-theme="sims"] .search-box:focus,
[data-theme="sims"] .form-input:focus,
[data-theme="sims"] .collection-select:focus {
  border-color: var(--color-accent);
  outline-color: var(--color-accent);
}
```

#### Focus Indicators

```css
[data-theme="sims"] *:focus-visible {
  outline-color: var(--color-accent);       /* Plumbob green instead of red */
}
```

#### Toast Notification

```css
[data-theme="sims"] .toast {
  background: var(--color-toast-bg);
  color: var(--color-text-primary);
  border-color: var(--color-border);
  border-left-color: var(--color-toast-border);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.10);
}
```

#### Loading Overlay

```css
[data-theme="sims"] .loading {
  background: var(--color-bg-panel);
  border-color: var(--color-accent);
}

[data-theme="sims"] .spinner {
  border-color: var(--color-border);
  border-top-color: var(--color-accent);
}
```

#### Progress Bar

```css
[data-theme="sims"] .progress-bar-track {
  background: var(--color-progress-track);
}

[data-theme="sims"] .progress-bar-fill {
  background: var(--color-progress-fill);   /* Teal instead of green */
}

[data-theme="sims"] .progress-complete {
  color: var(--color-accent);
}

[data-theme="sims"] .progress-checkmark {
  border-color: var(--color-accent);
}
```

#### Modal

```css
[data-theme="sims"] .modal {
  background: var(--color-modal-overlay);   /* Lighter overlay */
}

[data-theme="sims"] .modal-content {
  background: var(--color-modal-bg);
  border-color: var(--color-border-heavy);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
}
```

#### Play Button

```css
[data-theme="sims"] .btn-play {
  background: var(--color-bg-meter);
  color: var(--color-text-primary);
  border-color: var(--color-border);
}

[data-theme="sims"] .btn-play:hover {
  background: var(--color-accent);
  border-color: var(--color-accent);
  color: #FFFFFF;
}
```

#### Focus Mode Toggle

```css
[data-theme="sims"] .focus-option {
  background: var(--color-bg-primary);
  color: var(--color-text-secondary);
  border-color: var(--color-border);
}

[data-theme="sims"] .focus-option.active {
  background: var(--color-accent);
  color: #FFFFFF;
}
```

---

## Transition Animation

When switching between themes, the transition should feel intentional but not slow:

```css
body,
.header,
.event-card,
.category-header,
.btn,
.btn-primary,
.switch,
.sound-select,
.search-box,
.toast,
.modal-content,
.btn-play,
.focus-option,
.collection-select {
  transition:
    background-color 300ms ease,
    color 300ms ease,
    border-color 300ms ease,
    box-shadow 300ms ease;
}

/* LED strips should switch instantly (like flipping a hardware switch) */
.event-led-strip,
.switch.active::after {
  transition: background 80ms ease, box-shadow 80ms ease;
}
```

The background/text/borders morph smoothly over 300ms. LEDs snap instantly at 80ms. This creates the feeling of the room lights changing while indicators remain crisp.

---

## Side-by-Side Comparison

```
MGS THEME (Dark)                        SIMS THEME (Light)
+----------------------------------+    +----------------------------------+
| QUICK-PING 2                     |    | QUICK-PING 2                     |
| Sound Event Configuration...     |    | Sound Event Configuration...     |
|                                  |    |                                  |
|  [40]  [35]  [124]               |    |  [40]  [35]  [140+]             |
|  TOTAL ENABLED SOUNDS            |    |  TOTAL ENABLED SOUNDS            |
|                                  |    |                                  |
|  Collection: [MGS Default    v]  |    |  Collection: [Sims 2 Default v]  |
|                                  |    |                                  |
|  [Claude Suggests] [Save]        |    |  [Claude Suggests] [Save]        |
|  SEARCH EVENTS...                |    |  SEARCH EVENTS...                |
|----------------------------------|    |----------------------------------|
| CORE EVENTS                      |    | CORE EVENTS                      |
|                                  |    |                                  |
| +---GREEN LED STRIP-----------+  |    | +---TEAL LED STRIP------------+  |
| | SESSION START          [*]  |  |    | | SESSION START          [*]  |  |
| | Plays when session begins   |  |    | | Plays when session begins   |  |
| | [codec_ring.wav    v] [>]   |  |    | | [cheerful_hello.wav  v] [>] |  |
| +-----------------------------+  |    | +-----------------------------+  |
|                                  |    |                                  |
| Dark bg (#1A1A1A)                |    | Light bg (#F5F5F0)               |
| Green LEDs (#00FF00)             |    | Teal LEDs (#00D4AA)              |
| Red accent (#D63500)             |    | Teal accent (#00B389)            |
| White text on dark               |    | Dark text on light               |
+----------------------------------+    +----------------------------------+
```

---

## Accessibility Notes (Theme-Specific)

### Contrast Ratios (Sims Light Theme)

| Text | Background | Ratio | Pass? |
|------|-----------|-------|-------|
| `#1A2A24` on `#F5F5F0` | Page bg | ~14.5:1 | AA + AAA |
| `rgba(26,42,36,0.65)` on `#F5F5F0` | Page bg | ~8.0:1 | AA + AAA |
| `rgba(26,42,36,0.40)` on `#F5F5F0` | Page bg | ~4.5:1 | AA (normal) |
| `#FFFFFF` on `#00B389` | Primary btn | ~4.0:1 | AA (large text only) |
| `#1A2A24` on `#FFFFFF` | Panel bg | ~15.2:1 | AA + AAA |
| `#1A2A24` on `#ECEEE8` | Inset bg | ~13.0:1 | AA + AAA |
| `#00D4AA` on `#FFFFFF` | LED on white | ~2.5:1 | Decorative only |

**Note on primary button:** White text on `#00B389` has a contrast ratio of ~4.0:1, which passes AA for large text (14px bold or 18px+). Our button text is 12px bold uppercase. To ensure compliance:
- Option A: Darken the accent to `#008F6B` (ratio: ~5.0:1, passes AA at all sizes)
- Option B: Use dark text on the accent (`#1A2A24` on `#00B389` = ~5.8:1, passes AA)
- **Recommended: Option B** -- dark text on plumbob green buttons

```css
/* Updated for accessibility */
[data-theme="sims"] .btn-primary {
  background: var(--color-accent);
  color: #1A2A24;                          /* Dark text, not white */
  border-color: var(--color-accent);
}
```

### Focus Indicators

Both themes must have visible focus indicators. The MGS theme uses red (`#D63500`) outlines; the Sims theme uses plumbob green (`#00B389`) outlines. Both are sufficiently contrasting against their respective backgrounds.

### Reduced Motion

Theme transitions should be suppressed under `prefers-reduced-motion`:

```css
@media (prefers-reduced-motion: reduce) {
  body,
  .header,
  .event-card,
  .category-header,
  .btn,
  .switch,
  .sound-select,
  .search-box {
    transition: none !important;
  }
}
```

---

## Implementation Checklist

1. [ ] Add `data-theme` attribute to `<html>` element
2. [ ] Move current CSS custom properties under `:root, [data-theme="mgs"]`
3. [ ] Add `[data-theme="sims"]` block with all light theme tokens
4. [ ] Add component-level overrides for Sims theme (cards, buttons, LEDs, etc.)
5. [ ] Add transition CSS for smooth theme switching
6. [ ] Update `switchCollection()` in JS to set `data-theme`
7. [ ] Test all interactive states (hover, focus, active, disabled) in both themes
8. [ ] Verify WCAG contrast ratios in Sims theme
9. [ ] Test reduced motion behavior
10. [ ] Test at all breakpoints (mobile/tablet/desktop) in both themes

---

## Sound Description Labels

### Purpose

Sound filenames like `0x1a.wav` or `mGREETING.wav` tell the user nothing about what the sound actually is. A description label beneath the sound selector gives instant context: "Codec ring", "Cheerful greeting", "Alert (!)", etc. Users understand what they are about to hear without clicking Play.

### Updated Event Card Layout

```
BEFORE:                              AFTER:
+---GREEN LED STRIP-----------+     +---GREEN LED STRIP-----------+
| SESSION START          [*]  |     | SESSION START          [*]  |
| Plays when session begins   |     | Plays when session begins   |
| [codec_ring.wav    v] [>]   |     | [0x1a.wav            v] [>] |
+-----------------------------+     | "Codec ring"                 |
                                    +-----------------------------+
```

The description label sits directly below the controls row, inside the card.

### HTML Change (in createEventCard template)

Add after the `.event-controls` div:

```html
<div class="event-controls">
    <!-- existing: select + play button -->
</div>
<p class="sound-description" aria-label="Sound description">${event.sound_description || ''}</p>
```

### CSS -- Sound Description Label

```css
.sound-description {
    font-size: var(--font-size-micro);     /* 10px / 0.625rem */
    font-weight: var(--font-weight-regular);
    color: var(--color-text-tertiary);
    margin-top: var(--space-1);            /* 4px above */
    letter-spacing: 0.02em;
    line-height: 1.3;
    min-height: 13px;                      /* Reserve space even when empty */
    text-transform: none;                  /* Sentence case, not uppercase */
}

/* When description is empty, collapse gracefully */
.sound-description:empty {
    display: none;
}
```

### Sims Theme Override

```css
[data-theme="sims"] .sound-description {
    color: var(--color-text-tertiary);     /* Same token, different resolved value */
}
```

No special override needed -- the token `--color-text-tertiary` already resolves correctly in each theme. The label inherits the right color automatically.

### Dynamic Update

When the user changes the sound dropdown, the description should update to match the newly selected sound:

```javascript
// In the sound-select change handler:
card.querySelector('.sound-select').addEventListener('change', (e) => {
    const eventId = e.target.dataset.event;
    const sound = e.target.value;
    config.events[eventId].sound = sound;
    card.querySelector('.btn-play').dataset.sound = sound;

    // Update sound description
    const desc = getSoundDescription(sound);
    card.querySelector('.sound-description').textContent = desc;
});
```

### Data Source

Sound descriptions come from the config. Each event object gains a `sound_description` field:

```json
{
  "session_start": {
    "enabled": true,
    "sound": "0x1a.wav",
    "description": "Plays when a Claude Code session begins",
    "sound_description": "Codec ring"
  }
}
```

Additionally, a lookup table of sound-file-to-description mappings should exist so that when a user changes the sound dropdown, the description updates dynamically. This lookup can be:
- A `sound_descriptions` field in the collection metadata
- Or a separate API endpoint `/api/sound-descriptions`

**Recommended approach:** Store descriptions in the collection config so they travel with the collection:

```json
{
  "collections": {
    "default": {
      "name": "MGS Default",
      "sound_descriptions": {
        "0x1a.wav": "Codec ring",
        "0x01.wav": "Alert (!)",
        "0x67.wav": "Item pickup chime",
        "0x53.wav": "Alert (?)",
        "0x32.wav": "Explosion",
        "0x44.wav": "Stinger chord"
      }
    },
    "sims2_default": {
      "name": "Sims 2 Default",
      "sound_descriptions": {
        "mGREETING.wav": "Cheerful greeting",
        "Good Shot M.wav": "Enthusiastic 'Dag dag!'",
        "mAngry_1.wav": "Frustrated grumble",
        "mExcited_2.wav": "Excited cheer",
        "mLaugh_3.wav": "Hearty Simlish laugh",
        "mCry_1.wav": "Sad whimper"
      }
    }
  }
}
```

### Accessibility

- The label uses `aria-label="Sound description"` for screen readers
- Text color passes WCAG AA for non-essential decorative text (supplementary to the filename which is always visible)
- Description updates are announced via the card's `aria-label` context, no separate `aria-live` needed since the user initiated the change

### Visual Spec Summary

| Property | Value |
|----------|-------|
| Font size | `0.625rem` (10px) |
| Font weight | 400 (regular) |
| Color (MGS) | `rgba(255, 255, 255, 0.45)` |
| Color (Sims) | `rgba(26, 42, 36, 0.40)` |
| Case | Sentence case (not uppercase) |
| Spacing above | 4px (`--space-1`) |
| Letter spacing | 0.02em |
| Line height | 1.3 |
| Min height | 13px (prevents layout shift when empty) |
| Visibility when empty | Hidden (`display: none` via `:empty`) |

---

## Files Modified

- `control-panel.html` -- CSS additions + minor HTML template change in `createEventCard()`
- Collection config schema gains `sound_description` per event and `sound_descriptions` lookup per collection

---

## What This Means for the Showcase Site

The showcase site should demonstrate both themes. In the "Control Panel" section, instead of a single mockup, show:

```
+--MGS CONTROL PANEL (dark)---+    +--SIMS CONTROL PANEL (light)--+
|  Dark steel, green LEDs      |    |  Clean white, teal LEDs       |
|  Red accent buttons          |    |  Green accent buttons         |
|  "Tactical operations"       |    |  "Plumbob living room"        |
+------------------------------+    +-------------------------------+

"The entire experience adapts to your collection's vibe."
```

See the updated DESIGN-SPECS.md Section 4.3 for the showcase integration spec.
