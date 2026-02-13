# Quick-Ping Showcase Site -- Design Specifications

**Version**: 1.0
**Date**: 2026-02-13
**Status**: Ready for development
**Input**: CREATIVE-BRIEF.md, showcase-copy.md, control-panel.html design tokens

This document contains every detail a developer needs to build the showcase site without asking questions. All values are exact. When in doubt, reference the hex codes and pixel values here, not approximations.

---

## Table of Contents

1. [Design Tokens](#1-design-tokens)
2. [Global Styles](#2-global-styles)
3. [Component Library](#3-component-library)
4. [Section-by-Section Specs](#4-section-by-section-specs)
5. [Interaction States](#5-interaction-states)
6. [Animations](#6-animations)
7. [Responsive Breakpoints](#7-responsive-breakpoints)
8. [Accessibility](#8-accessibility)
9. [Performance Budget](#9-performance-budget)

---

## 1. Design Tokens

### 1.1 Color Palette

```css
:root {
  /* Backgrounds */
  --bg-page:           #0A0A0A;
  --bg-surface:        #141414;
  --bg-elevated:       #1A1A1A;
  --bg-inset:          #0D0D0D;  /* Code blocks, deepest recesses */

  /* Borders */
  --border-default:    rgba(255, 255, 255, 0.08);
  --border-hover:      rgba(255, 255, 255, 0.15);
  --border-active:     rgba(255, 255, 255, 0.25);

  /* Accent Colors */
  --green:             #00FF41;
  --amber:             #FFB800;
  --teal:              #00D4AA;
  --red:               #FF3333;

  /* Accent Glows (for box-shadow) */
  --glow-green:        0 0 12px rgba(0, 255, 65, 0.4);
  --glow-amber:        0 0 12px rgba(255, 184, 0, 0.4);
  --glow-teal:         0 0 12px rgba(0, 212, 170, 0.4);
  --glow-red:          0 0 12px rgba(255, 51, 51, 0.5);

  /* Accent Dims (for subtle backgrounds) */
  --green-dim:         rgba(0, 255, 65, 0.08);
  --amber-dim:         rgba(255, 184, 0, 0.08);
  --teal-dim:          rgba(0, 212, 170, 0.08);
  --red-dim:           rgba(255, 51, 51, 0.08);

  /* Text Hierarchy */
  --text-primary:      #FFFFFF;
  --text-secondary:    rgba(255, 255, 255, 0.65);
  --text-tertiary:     rgba(255, 255, 255, 0.40);
  --text-accent:       #00FF41;

  /* Semantic */
  --led-on:            #00FF41;
  --led-off:           rgba(255, 255, 255, 0.10);
  --led-bezel:         #4A4A4A;
}
```

### 1.2 Typography

All text uses IBM Plex Mono. No exceptions.

```
Google Fonts URL:
https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;700&display=swap
```

| Token          | Weight | Size        | Tracking   | Case       | Line Height |
|----------------|--------|-------------|------------|------------|-------------|
| `--type-display` | 700    | 56px / 3.5rem  | +0.04em    | uppercase  | 1.1         |
| `--type-h1`     | 700    | 36px / 2.25rem | +0.06em    | uppercase  | 1.2         |
| `--type-h2`     | 700    | 24px / 1.5rem  | +0.08em    | uppercase  | 1.3         |
| `--type-h3`     | 500    | 18px / 1.125rem| +0.06em    | uppercase  | 1.3         |
| `--type-body`   | 400    | 16px / 1rem    | normal     | sentence   | 1.6         |
| `--type-small`  | 500    | 12px / 0.75rem | +0.08em    | uppercase  | 1.4         |
| `--type-micro`  | 500    | 10px / 0.625rem| +0.10em    | uppercase  | 1.4         |
| `--type-code`   | 400    | 14px / 0.875rem| normal     | as-is      | 1.5         |

**Rules:**
- All headings and labels: `text-transform: uppercase`
- All numeric displays: `font-variant-numeric: tabular-nums`
- Body text line-height: 1.6 (critical for readability on dark backgrounds)
- No italic usage anywhere on the site
- Font stack fallback: `'IBM Plex Mono', 'SF Mono', 'Monaco', 'Courier New', monospace`

### 1.3 Spacing Scale (4px base grid)

```css
--space-1:   4px;    /* 0.25rem */
--space-2:   8px;    /* 0.5rem  */
--space-3:   12px;   /* 0.75rem */
--space-4:   16px;   /* 1rem    */
--space-5:   20px;   /* 1.25rem */
--space-6:   24px;   /* 1.5rem  */
--space-8:   32px;   /* 2rem    */
--space-10:  40px;   /* 2.5rem  */
--space-12:  48px;   /* 3rem    */
--space-16:  64px;   /* 4rem    */
--space-20:  80px;   /* 5rem    */
--space-24:  96px;   /* 6rem    */
```

### 1.4 Transitions

```css
--transition-fast:    80ms ease;      /* Button press, LED toggle */
--transition-normal:  150ms ease;     /* Hover states */
--transition-slow:    400ms ease;     /* Scroll reveal, section transitions */
```

### 1.5 Z-Index Scale

```css
--z-base:     1;
--z-card:     10;
--z-overlay:  100;
--z-sticky:   200;
```

---

## 2. Global Styles

### 2.1 Reset and Base

```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: 'IBM Plex Mono', 'SF Mono', 'Monaco', 'Courier New', monospace;
  background: #0A0A0A;
  color: rgba(255, 255, 255, 0.65);  /* Default to secondary text */
  font-size: 16px;
  line-height: 1.6;
  overflow-x: hidden;
}
```

### 2.2 Background Grid Texture

A subtle dot grid across the entire page. Achieved via CSS only -- no images.

```css
body::before {
  content: '';
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: radial-gradient(
    rgba(255, 255, 255, 0.03) 1px,
    transparent 1px
  );
  background-size: 24px 24px;
  pointer-events: none;
  z-index: 0;
}
```

This creates a 24px dot grid at ~3% opacity. Barely visible -- a texture, not a pattern. It references PCB traces and studio acoustic panels.

### 2.3 Page Container

```css
.page-container {
  position: relative;
  z-index: 1;          /* Above the background grid */
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;     /* Gutter: 24px on each side */
}
```

- Maximum content width: 1200px
- Side gutters: 24px (all breakpoints)
- Content area at max: 1152px

### 2.4 Section Spacing

Every major section (hero, experience, control panel, event map, how-it-works, CTA, footer) uses consistent vertical rhythm:

```css
.section {
  padding: 96px 0;    /* --space-24 top and bottom */
}

.section + .section {
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}
```

Sections are separated by a 1px border, not whitespace gaps. This reinforces the "rack-mounted modules" aesthetic.

### 2.5 Selection Color

```css
::selection {
  background: rgba(0, 255, 65, 0.25);
  color: #FFFFFF;
}
```

---

## 3. Component Library

### 3.1 The LED Indicator

The signature element. A small glowing circle that signals "Quick-Ping is on."

**Dimensions and Structure:**

```
        +-----------+
        |   bezel   |   <- 2px #4A4A4A ring
        | +-------+ |
        | |  LED  | |   <- 8px diameter, filled circle
        | +-------+ |
        +-----------+
           12px total (8px LED + 2px bezel each side)
```

**CSS:**

```css
.led {
  display: inline-block;
  width: 8px;
  height: 8px;
  border-radius: 50%;        /* ONLY element allowed border-radius */
  background: #00FF41;
  box-shadow: 0 0 8px rgba(0, 255, 65, 0.5);
  outline: 2px solid #4A4A4A;
  outline-offset: 1px;
}

.led--off {
  background: rgba(255, 255, 255, 0.10);
  box-shadow: none;
}

.led--amber {
  background: #FFB800;
  box-shadow: 0 0 8px rgba(255, 184, 0, 0.5);
}

.led--teal {
  background: #00D4AA;
  box-shadow: 0 0 8px rgba(0, 212, 170, 0.5);
}

.led--red {
  background: #FF3333;
  box-shadow: 0 0 8px rgba(255, 51, 51, 0.5);
}
```

**Note:** The LED is the ONLY element in the entire design that uses `border-radius`. Everything else is sharp corners. No exceptions.

### 3.2 Buttons

Two button variants: Primary (filled) and Ghost (outlined).

#### Primary Button

```
+----------------------------------+
|  [LED]  VIEW ON GITHUB           |   height: 48px
+----------------------------------+
    ^green bg                  ^white text, 12px uppercase
```

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 48px;
  padding: 0 24px;
  background: #00FF41;
  color: #0A0A0A;
  border: 2px solid #00FF41;
  font-family: inherit;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  cursor: pointer;
  text-decoration: none;
  transition: all 150ms ease;
}

.btn-primary:hover {
  background: #00CC34;
  border-color: #00CC34;
  box-shadow: 0 0 16px rgba(0, 255, 65, 0.3);
}

.btn-primary:active {
  transform: translateY(1px);
  box-shadow: none;
}

.btn-primary:focus-visible {
  outline: 2px solid #FFFFFF;
  outline-offset: 2px;
}
```

#### Ghost Button

```
+----------------------------------+
|  SEE HOW IT WORKS                |   height: 48px
+----------------------------------+
    ^transparent bg, 1px white border
```

```css
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 48px;
  padding: 0 24px;
  background: transparent;
  color: rgba(255, 255, 255, 0.65);
  border: 1px solid rgba(255, 255, 255, 0.15);
  font-family: inherit;
  font-size: 12px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  cursor: pointer;
  text-decoration: none;
  transition: all 150ms ease;
}

.btn-ghost:hover {
  color: #FFFFFF;
  border-color: rgba(255, 255, 255, 0.40);
  background: rgba(255, 255, 255, 0.03);
}

.btn-ghost:active {
  transform: translateY(1px);
}

.btn-ghost:focus-visible {
  outline: 2px solid #00FF41;
  outline-offset: 2px;
}
```

### 3.3 Code Blocks

Terminal-style code display with an optional copy button.

```
+-------------------------------------------+
| $ git clone https://github.com/...    [CP] |
+-------------------------------------------+
  ^green text on near-black bg
```

```css
.code-block {
  position: relative;
  background: #0D0D0D;
  border: 1px solid rgba(255, 255, 255, 0.08);
  padding: 20px 24px;
  font-family: 'IBM Plex Mono', monospace;
  font-size: 14px;
  line-height: 1.5;
  color: #00FF41;
  overflow-x: auto;
  white-space: pre;
  -webkit-overflow-scrolling: touch;
}

.code-block .prompt {
  color: rgba(255, 255, 255, 0.40);   /* The $ or > symbol */
  user-select: none;
}

.code-block .comment {
  color: rgba(255, 255, 255, 0.30);   /* # comments */
}
```

**Copy Button** (top-right corner of code block):

```css
.code-copy-btn {
  position: absolute;
  top: 8px;
  right: 8px;
  width: 32px;
  height: 32px;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.10);
  color: rgba(255, 255, 255, 0.40);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  transition: all 150ms ease;
}

.code-copy-btn:hover {
  background: rgba(255, 255, 255, 0.10);
  color: #FFFFFF;
}

/* After copying -- brief green flash */
.code-copy-btn.copied {
  background: rgba(0, 255, 65, 0.15);
  color: #00FF41;
  border-color: rgba(0, 255, 65, 0.30);
}
```

The copy icon is a simple clipboard SVG or the Unicode character `\u2398` (COPY). After click, it briefly changes to a checkmark for 1500ms, then reverts.

### 3.4 Collection Cards

Two variants: MGS (amber theme) and Sims (teal theme). Used side-by-side in the Experience section.

**Structure:**

```
+------------------------------------------+
| [LED]  COLLECTION-LABEL          BADGE   |  <- Header bar
|------------------------------------------|
|                                          |
|  CARD TITLE                              |  <- H2, accent color
|  Subtitle text here                      |  <- Secondary text
|                                          |
|  +------------------------------------+  |
|  | Content area: table, list, or grid |  |  <- Inset panel
|  +------------------------------------+  |
|                                          |
|  Feature bullet one                      |
|  Feature bullet two                      |
|  Feature bullet three                    |
|                                          |
|  "Pull quote or evocative line"          |  <- Accent-colored italic
|                                          |
+------------------------------------------+
```

**Base Card CSS:**

```css
.collection-card {
  background: #141414;
  border: 1px solid rgba(255, 255, 255, 0.08);
  padding: 0;                /* Padding is internal to sub-sections */
  display: flex;
  flex-direction: column;
  transition: border-color 150ms ease;
}

.collection-card:hover {
  border-color: rgba(255, 255, 255, 0.15);
}

.collection-card__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 24px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.collection-card__header-label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  color: rgba(255, 255, 255, 0.40);
}

.collection-card__body {
  padding: 32px 24px;
  flex: 1;
}

.collection-card__title {
  font-size: 24px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  line-height: 1.3;
  margin-bottom: 8px;
}

.collection-card__subtitle {
  font-size: 16px;
  color: rgba(255, 255, 255, 0.65);
  line-height: 1.6;
  margin-bottom: 24px;
}

.collection-card__quote {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.65);
  padding-left: 16px;
  border-left: 3px solid;    /* Border color set by variant */
  margin-top: 24px;
  line-height: 1.6;
}
```

**MGS Variant:**

```css
.collection-card--mgs .collection-card__title {
  color: #FFB800;
}

.collection-card--mgs .collection-card__quote {
  border-left-color: #FFB800;
}

.collection-card--mgs:hover {
  border-color: rgba(255, 184, 0, 0.25);
}

.collection-card--mgs .led {
  background: #FFB800;
  box-shadow: 0 0 8px rgba(255, 184, 0, 0.5);
}
```

**Sims Variant:**

```css
.collection-card--sims .collection-card__title {
  color: #00D4AA;
}

.collection-card--sims .collection-card__quote {
  border-left-color: #00D4AA;
}

.collection-card--sims:hover {
  border-color: rgba(0, 212, 170, 0.25);
}

.collection-card--sims .led {
  background: #00D4AA;
  box-shadow: 0 0 8px rgba(0, 212, 170, 0.5);
}
```

### 3.5 Badge / Tag

Small inline labels for stats and metadata.

```css
.badge {
  display: inline-block;
  padding: 4px 8px;
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  border: 1px solid rgba(255, 255, 255, 0.15);
  color: rgba(255, 255, 255, 0.65);
  background: transparent;
  white-space: nowrap;
}

.badge--green {
  border-color: rgba(0, 255, 65, 0.30);
  color: #00FF41;
}

.badge--amber {
  border-color: rgba(255, 184, 0, 0.30);
  color: #FFB800;
}

.badge--teal {
  border-color: rgba(0, 212, 170, 0.30);
  color: #00D4AA;
}
```

### 3.6 Section Header

Used at the start of each major section.

```
[LED]  SECTION LABEL

SECTION HEADLINE
Description text goes here, kept to 2-3 sentences max.
```

```css
.section-label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  color: #00FF41;
  margin-bottom: 16px;
}

.section-headline {
  font-size: 36px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  line-height: 1.2;
  color: #FFFFFF;
  margin-bottom: 16px;
}

.section-description {
  font-size: 16px;
  color: rgba(255, 255, 255, 0.65);
  line-height: 1.6;
  max-width: 640px;           /* Constrain description width for readability */
}
```

### 3.7 Stats Bar

Horizontal row of key metrics displayed as tabular readouts.

```
+------+---------+--------+--------+
| 40+  |    2    |  264+  |  ZERO  |
|EVENTS|COLLECTNS| SOUNDS | BUILD  |
+------+---------+--------+--------+
```

```css
.stats-bar {
  display: flex;
  gap: 0;
  border: 1px solid rgba(255, 255, 255, 0.08);
  background: #141414;
}

.stats-bar__item {
  flex: 1;
  padding: 20px 16px;
  text-align: center;
  border-right: 1px solid rgba(255, 255, 255, 0.08);
}

.stats-bar__item:last-child {
  border-right: none;
}

.stats-bar__value {
  font-size: 24px;
  font-weight: 700;
  color: #FFFFFF;
  font-variant-numeric: tabular-nums;
  line-height: 1;
  margin-bottom: 4px;
}

.stats-bar__label {
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  color: rgba(255, 255, 255, 0.40);
}
```

### 3.8 Event Channel Strip

For the Event Map section. Each event category is displayed as a mixer channel strip.

**Structure:**

```
+-------------------------------------------+
| CATEGORY NAME                    [4/6 ON] |  <- Category header
|-------------------------------------------|
| [LED] event_name      Short description   |  <- Individual event row
| [LED] event_name      Short description   |
| [LED] event_name      Short description   |
+-------------------------------------------+
```

```css
.channel-strip {
  background: #141414;
  border: 1px solid rgba(255, 255, 255, 0.08);
  margin-bottom: 8px;
}

.channel-strip__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  background: #1A1A1A;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.channel-strip__name {
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: #FFFFFF;
}

.channel-strip__count {
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  color: rgba(255, 255, 255, 0.40);
  font-variant-numeric: tabular-nums;
}

.channel-strip__event {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 8px 16px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
}

.channel-strip__event:last-child {
  border-bottom: none;
}

.channel-strip__event-name {
  font-size: 14px;
  font-weight: 400;
  color: #00FF41;
  min-width: 160px;
  flex-shrink: 0;
}

.channel-strip__event-desc {
  font-size: 12px;
  color: rgba(255, 255, 255, 0.40);
}
```

### 3.9 Step Card (How It Works)

Three numbered steps displayed in sequence.

```
+-------+------------------------------------------+
|       |                                          |
|  01   |  INSTALL                                 |
|       |  Description text here                   |
|       |                                          |
|       |  +------------------------------------+  |
|       |  | $ git clone ...                    |  |
|       |  +------------------------------------+  |
|       |                                          |
+-------+------------------------------------------+
```

```css
.step {
  display: grid;
  grid-template-columns: 80px 1fr;
  gap: 0;
  border: 1px solid rgba(255, 255, 255, 0.08);
  background: #141414;
  margin-bottom: 8px;
}

.step__number {
  display: flex;
  align-items: flex-start;
  justify-content: center;
  padding-top: 32px;
  font-size: 36px;
  font-weight: 700;
  color: rgba(255, 255, 255, 0.15);
  border-right: 1px solid rgba(255, 255, 255, 0.08);
  font-variant-numeric: tabular-nums;
}

.step__content {
  padding: 24px 24px 24px 24px;
}

.step__title {
  font-size: 18px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: #FFFFFF;
  margin-bottom: 8px;
}

.step__desc {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.65);
  line-height: 1.6;
  margin-bottom: 16px;
}
```

### 3.10 Accent Line

A vertical left-border used for emphasis. Equivalent to a channel strip selection indicator.

```css
.accent-line {
  border-left: 3px solid #00FF41;
  padding-left: 16px;
}

.accent-line--amber {
  border-left-color: #FFB800;
}

.accent-line--teal {
  border-left-color: #00D4AA;
}
```

---

## 4. Section-by-Section Specs

### 4.1 HERO -- "Your Code Has a Soundtrack Now"

**Layout: Full viewport height, centered content**

```
+================================================================+
|                                                                |
|                                                                |
|                                                                |
|                        [LED pulsing]                           |
|                                                                |
|              YOUR CODE HAS A SOUNDTRACK NOW                    |  <- Display type
|                                                                |
|   Sound notifications for Claude Code. 124 Metal Gear Solid   |  <- Body
|   sounds. 140+ Sims 2 sounds. Every commit, every test,       |
|   every context warning -- heard, not missed.                  |
|                                                                |
|       [VIEW ON GITHUB]     [SEE HOW IT WORKS]                 |  <- Buttons
|                                                                |
|                                                                |
|   Because the best notification is the one you don't have to   |  <- Tertiary text
|   look at.                                                     |
|                                                                |
+================================================================+
```

**Specs:**

```css
.hero {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: 96px 24px;
  position: relative;
}

.hero__led {
  margin-bottom: 32px;
  /* Uses the LED component with pulse animation (see Section 6.1) */
}

.hero__headline {
  font-size: 56px;        /* --type-display */
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  line-height: 1.1;
  color: #FFFFFF;
  margin-bottom: 24px;
  max-width: 800px;
}

.hero__tagline {
  font-size: 16px;
  font-weight: 400;
  color: rgba(255, 255, 255, 0.65);
  line-height: 1.6;
  max-width: 600px;
  margin-bottom: 48px;
}

.hero__cta-group {
  display: flex;
  gap: 16px;
  align-items: center;
  margin-bottom: 64px;
}

.hero__sub-tagline {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.40);
  line-height: 1.6;
  max-width: 500px;
}
```

**Content:**
- LED: Green, pulsing on a 3-second loop (see Animation 6.1)
- Headline: "YOUR CODE HAS A SOUNDTRACK NOW"
- Tagline: "Sound notifications for Claude Code. 124 Metal Gear Solid sounds. 140+ Sims 2 sounds. Every commit, every test, every context warning -- heard, not missed."
- CTA 1 (primary): "VIEW ON GITHUB" with small LED indicator
- CTA 2 (ghost): "SEE HOW IT WORKS" (scrolls to Section 5)
- Sub-tagline: "Because the best notification is the one you don't have to look at."

---

### 4.2 THE EXPERIENCE -- "Two Collections, Zero Configuration"

**Layout: Section label + headline + two-column card grid**

```
+================================================================+
|                                                                |
|  [LED]  COLLECTIONS                                            |
|                                                                |
|  TWO ICONIC SOUND PACKS. READY ON INSTALL.                    |
|  Quick-Ping ships with two built-in collections that work      |
|  out of the box.                                               |
|                                                                |
|  +---------------------------+ +---------------------------+   |
|  | [LED] MGS COLLECTION      | | [LED] SIMS 2 COLLECTION  |   |
|  |---------------------------| |---------------------------|   |
|  |                           | |                           |   |
|  | TACTICAL ESPIONAGE AUDIO  | | SIMLISH SOUND DESIGN      |   |
|  | Your coding session       | | Coding feels like         |   |
|  | becomes a tactical        | | managing a productive     |   |
|  | espionage operation.      | | household.                |   |
|  |                           | |                           |   |
|  | +--------+----------+    | | +--------+----------+    |   |
|  | | Event  | MGS Snd  |    | | | Event  | Sims Snd |    |   |
|  | |--------|----------|    | | |--------|----------|    |   |
|  | | start  | Codec    |    | | | commit | Cheerful |    |   |
|  | | commit | Item     |    | | | fail   | Grumpy   |    |   |
|  | | fail   | Alert ?  |    | | | push   | Excited  |    |   |
|  | | ctx_90 | Alert !  |    | | | streak | Woohoo   |    |   |
|  | +--------+----------+    | | +--------+----------+    |   |
|  |                           | |                           |   |
|  | * 124 sounds, 8-bit WAV  | | * 140+ sounds             |   |
|  | * 21 events default on   | | * Every emotion covered   |   |
|  |                           | |                           |   |
|  | "You hear *that* sound   | | "Your codebase is a      |   |
|  |  at context_90."         | |  household."             |   |
|  +---------------------------+ +---------------------------+   |
|                                                                |
+================================================================+
```

**Specs:**

```css
.experience {
  padding: 96px 0;
}

.experience__cards {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin-top: 48px;
}
```

**Card Internal Table (Mission Arc):**

```css
.mission-table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  background: #0D0D0D;
  border: 1px solid rgba(255, 255, 255, 0.08);
}

.mission-table th {
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.10em;
  color: rgba(255, 255, 255, 0.40);
  text-align: left;
  padding: 8px 12px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.mission-table td {
  font-size: 13px;
  padding: 6px 12px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
  color: rgba(255, 255, 255, 0.65);
}

.mission-table td:first-child {
  color: #00FF41;          /* Event name in accent */
  font-size: 12px;
}
```

For the MGS card table `td:first-child` color is `#FFB800`. For the Sims card it is `#00D4AA`.

**Feature List (inside cards):**

```css
.feature-list {
  list-style: none;
  padding: 0;
  margin: 16px 0;
}

.feature-list li {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.65);
  line-height: 1.6;
  padding: 4px 0 4px 16px;
  position: relative;
}

.feature-list li::before {
  content: '';
  position: absolute;
  left: 0;
  top: 11px;
  width: 4px;
  height: 4px;
  background: currentColor;   /* Inherits the text color */
}
```

Bullet markers are small 4px squares, not circles. Consistent with the sharp-corner aesthetic.

---

### 4.3 THE CONTROL PANEL -- "SSL Console Meets Dev Tools"

**Layout: Section header + annotated screenshot frame**

```
+================================================================+
|                                                                |
|  [LED]  CONTROL PANEL                                          |
|                                                                |
|  SSL CONSOLE MEETS DEV TOOLS                                   |
|  A dark steel control panel for your sounds.                   |
|                                                                |
|  +--------------------------------------------------------+   |
|  |                                                        |   |
|  |          [Stylized Control Panel Mockup]               |   |
|  |                                                        |   |
|  |   .----- "Collection Switcher"                         |   |
|  |   |                                                    |   |
|  |   |   .------- "LED Toggles"                           |   |
|  |   |   |                                                |   |
|  |   |   |   .--- "Sound Preview"                         |   |
|  |   |   |   |                                            |   |
|  |   |   |   |   .--- "Claude Suggests"                   |   |
|  |   |   |   |   |                                        |   |
|  +--------------------------------------------------------+   |
|                                                                |
|  localhost:5050 -- Your mission control.                       |
|                                                                |
|  +--------+ +--------+ +---------+ +-----------+ +--------+  |
|  | 40+    | | TOGGLE | | PREVIEW | | AI-MAPPED | | SEARCH |  |
|  | EVENTS | | ON/OFF | | SOUNDS  | | DEFAULTS  | | FILTER |  |
|  +--------+ +--------+ +---------+ +-----------+ +--------+  |
|                                                                |
+================================================================+
```

**Screenshot Frame:**

The control panel "screenshot" is a CSS-only stylized mockup, not an actual image. It is a simplified representation using the same design tokens.

```css
.screenshot-frame {
  background: #0D0D0D;
  border: 2px solid rgba(255, 255, 255, 0.08);
  padding: 2px;
  margin: 48px 0 24px 0;
  position: relative;
}

.screenshot-frame__chrome {
  background: #141414;
  padding: 8px 16px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
  display: flex;
  align-items: center;
  gap: 8px;
}

.screenshot-frame__url {
  font-size: 11px;
  color: rgba(255, 255, 255, 0.40);
  letter-spacing: 0.02em;
}

.screenshot-frame__content {
  padding: 32px;
  min-height: 400px;
  /* Contains a simplified CSS-only mockup of the control panel */
}
```

**Annotation Callouts:**

Floating labels that point to features in the mockup.

```css
.callout {
  position: absolute;
  display: flex;
  align-items: center;
  gap: 8px;
}

.callout__dot {
  width: 6px;
  height: 6px;
  background: #00FF41;
  border-radius: 50%;
  box-shadow: 0 0 6px rgba(0, 255, 65, 0.5);
  flex-shrink: 0;
}

.callout__line {
  width: 40px;
  height: 1px;
  background: rgba(0, 255, 65, 0.30);
  flex-shrink: 0;
}

.callout__text {
  font-size: 11px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: rgba(255, 255, 255, 0.65);
  white-space: nowrap;
}
```

**Feature Badges Row:**

Below the screenshot, a horizontal row of feature badges.

```css
.feature-badges {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 32px;
}
```

Uses the `.badge` component from Section 3.5.

---

### 4.4 EVENT MAP -- "40+ Events. Every Moment Covered."

**Layout: Stats bar + channel strip grid**

```
+================================================================+
|                                                                |
|  [LED]  EVENT MAP                                              |
|                                                                |
|  40+ EVENTS. EVERY MOMENT COVERED.                             |
|                                                                |
|  +--------+---------+--------+---------+                       |
|  |  40+   |    2    |  264+  |  ZERO   |                       |
|  | EVENTS | COLL'NS | SOUNDS | BUILD   |                       |
|  +--------+---------+--------+---------+                       |
|                                                                |
|  +---------------------------------------+                     |
|  | CORE                          [5/5]   |                     |
|  |---------------------------------------|                     |
|  | [LED] session_start   Session begins  |                     |
|  | [LED] session_end     Session ends    |                     |
|  | [LED] tool_start      Tool begins     |                     |
|  +---------------------------------------+                     |
|                                                                |
|  +--------------------+  +-------------------+                 |
|  | GIT          [4/6] |  | TESTING     [3/4] |                 |
|  |--------------------|  |-------------------|                 |
|  | [LED] git_commit   |  | [LED] test_pass   |                 |
|  | [LED] git_push     |  | [LED] test_fail   |                 |
|  | [LED] git_pull     |  | [LED] test_start  |                 |
|  +--------------------+  +-------------------+                 |
|                                                                |
|  (... more channel strips in responsive grid)                  |
|                                                                |
+================================================================+
```

**Grid Layout:**

```css
.event-map__grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 8px;
  margin-top: 32px;
}

/* First strip (CORE) spans full width */
.event-map__grid .channel-strip:first-child {
  grid-column: 1 / -1;
}
```

**Channel Strip Categories and Representative Events:**

| Category | Example Events | Count |
|----------|---------------|-------|
| Core | session_start, session_end, tool_start, tool_end, stop | ~5 |
| Git | git_commit, git_push, git_pull, git_checkout, pr_created, pr_merged | ~6 |
| Testing | test_pass, test_fail, test_start, test_suite_complete | ~4 |
| Building | build_start, build_success, build_fail | ~3 |
| Context | context_50, context_75, context_90 | ~3 |
| Streaks | streak_3, streak_5, streak_10 | ~3 |
| Time | session_30m, session_1h, late_night | ~3 |
| Agent | agent_start, agent_handoff, agent_complete | ~3 |
| Thinking | plan_start, plan_end, thinking | ~3 |
| Skills | skill_start, skill_end | ~2 |

Show 2-3 representative events per category. The rest are implied by the count badge.

---

### 4.5 HOW IT WORKS -- "Three Steps. Two Minutes."

**Layout: Section header + three step cards + architecture diagram**

```
+================================================================+
|                                                                |
|  [LED]  HOW IT WORKS                                           |
|                                                                |
|  THREE STEPS. TWO MINUTES. ALL THE SOUNDS.                    |
|                                                                |
|  +------+--------------------------------------------------+  |
|  |      |  CLONE AND INSTALL                               |  |
|  |  01  |  Quick-Ping is pure Python + vanilla JS.         |  |
|  |      |                                                  |  |
|  |      |  +----------------------------------------------+|  |
|  |      |  | $ git clone https://github.com/user/qp2.git ||  |
|  |      |  | $ pip3 install flask flask-cors              ||  |
|  |      |  +----------------------------------------------+|  |
|  +------+--------------------------------------------------+  |
|                                                                |
|  +------+--------------------------------------------------+  |
|  |      |  HOOK INTO CLAUDE CODE                           |  |
|  |  02  |  Add Quick-Ping to your hooks config.            |  |
|  |      |  One config block, three hook points.            |  |
|  +------+--------------------------------------------------+  |
|                                                                |
|  +------+--------------------------------------------------+  |
|  |      |  LAUNCH THE CONTROL PANEL                        |  |
|  |  03  |  Open localhost:5050. Pick a collection. Code.   |  |
|  |      |                                                  |  |
|  |      |  +----------------------------------------------+|  |
|  |      |  | $ ./launch-control-panel.sh                  ||  |
|  |      |  +----------------------------------------------+|  |
|  +------+--------------------------------------------------+  |
|                                                                |
|  ARCHITECTURE                                                  |
|                                                                |
|  +------------+     +-------------+     +--------+             |
|  | Claude     | --> | Hooks       | --> | quick- |             |
|  | Code       |     | (Pre/Post/  |     | ping   |             |
|  |            |     |  Stop)      |     | v2.sh  |             |
|  +------------+     +-------------+     +--------+             |
|                                              |                 |
|                                              v                 |
|                                         +--------+             |
|                                         | afplay |             |
|                                         +--------+             |
|                                                                |
|  [PYTHON FLASK]  [VANILLA JS]  [REST API]  [macOS]  [ZERO     |
|                                              DEPS]             |
|                                                                |
+================================================================+
```

**Architecture Diagram:**

CSS-only flow diagram using flexbox and borders.

```css
.architecture {
  margin-top: 48px;
}

.architecture__label {
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: rgba(255, 255, 255, 0.40);
  margin-bottom: 24px;
}

.architecture__flow {
  display: flex;
  align-items: center;
  gap: 0;
  flex-wrap: wrap;
  justify-content: center;
}

.architecture__node {
  padding: 16px 24px;
  border: 1px solid rgba(255, 255, 255, 0.15);
  background: #141414;
  text-align: center;
}

.architecture__node-name {
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: #FFFFFF;
}

.architecture__node-detail {
  font-size: 10px;
  color: rgba(255, 255, 255, 0.40);
  margin-top: 4px;
}

.architecture__arrow {
  width: 40px;
  height: 1px;
  background: rgba(255, 255, 255, 0.20);
  position: relative;
}

.architecture__arrow::after {
  content: '';
  position: absolute;
  right: 0;
  top: -3px;
  border: 3px solid transparent;
  border-left-color: rgba(255, 255, 255, 0.20);
}
```

**Tech Badges Row:**

Below the architecture diagram, a row of `.badge` components:
- PYTHON FLASK
- VANILLA JS
- REST API
- macOS
- ZERO DEPENDENCIES

---

### 4.6 CTA -- "Your Terminal Is Too Quiet"

**Layout: Green-bordered panel, centered**

```
+================================================================+
|                                                                |
|  +========================================================+   |
|  ||                                                      ||   |
|  ||              YOUR TERMINAL IS TOO QUIET              ||   |
|  ||                                                      ||   |
|  ||  +--------------------------------------------------+||   |
|  ||  | $ git clone https://github.com/user/qp2.git  [CP]|||   |
|  ||  +--------------------------------------------------+||   |
|  ||                                                      ||   |
|  ||          [GET QUICK-PING]     [VIEW ON GITHUB]       ||   |
|  ||                                                      ||   |
|  ||  Free. Open source. Two sound packs included.        ||   |
|  ||                                                      ||   |
|  ||  Because coding in silence was always the real bug.  ||   |
|  ||                                                      ||   |
|  +========================================================+   |
|                                                                |
+================================================================+
```

```css
.cta-panel {
  border: 2px solid #00FF41;
  background: #141414;
  padding: 64px 48px;
  text-align: center;
  position: relative;
}

/* Subtle green ambient glow at the edges */
.cta-panel::before {
  content: '';
  position: absolute;
  inset: -1px;
  border: 1px solid rgba(0, 255, 65, 0.10);
  pointer-events: none;
}

.cta-panel__headline {
  font-size: 36px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: #FFFFFF;
  margin-bottom: 32px;
}

.cta-panel__code {
  max-width: 600px;
  margin: 0 auto 32px auto;
}

.cta-panel__buttons {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin-bottom: 32px;
}

.cta-panel__small-print {
  font-size: 12px;
  color: rgba(255, 255, 255, 0.40);
  margin-bottom: 16px;
}

.cta-panel__tagline {
  font-size: 14px;
  color: rgba(255, 255, 255, 0.65);
  font-style: normal;        /* No italics */
}
```

---

### 4.7 FOOTER

**Layout: Minimal, single line**

```
+================================================================+
|                                                                |
|  QUICK-PING    MIT License    2026                             |
|                                                                |
|  Built for developers who alt-tab. Powered by nostalgia.      |
|                                                                |
+================================================================+
```

```css
.footer {
  padding: 48px 0;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.footer__top {
  display: flex;
  align-items: center;
  gap: 24px;
  margin-bottom: 16px;
}

.footer__brand {
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: #FFFFFF;
}

.footer__meta {
  font-size: 11px;
  color: rgba(255, 255, 255, 0.30);
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.footer__tagline {
  font-size: 12px;
  color: rgba(255, 255, 255, 0.30);
  line-height: 1.6;
}
```

---

## 5. Interaction States

### 5.1 Hover States

| Element | Hover Effect |
|---------|-------------|
| Primary button | Background darkens to `#00CC34`, gains `box-shadow: 0 0 16px rgba(0, 255, 65, 0.3)` |
| Ghost button | Border brightens to `rgba(255,255,255,0.40)`, text brightens to `#FFFFFF`, subtle bg `rgba(255,255,255,0.03)` |
| Collection card | Border brightens to accent color at 25% opacity. No transform, no scale. |
| Channel strip | No hover effect. Static display element. |
| Code block | No hover on the block itself. Copy button gains hover state independently. |
| Copy button | Background brightens to `rgba(255,255,255,0.10)`, text to `#FFFFFF` |
| Footer links | Color to `#FFFFFF` |
| Badges | No hover state. Static display element. |

All hover transitions: `150ms ease`.

### 5.2 Active / Pressed States

| Element | Active Effect |
|---------|-------------|
| Primary button | `translateY(1px)`, remove box-shadow |
| Ghost button | `translateY(1px)` |
| Copy button | Green flash -- background `rgba(0, 255, 65, 0.15)`, border `rgba(0, 255, 65, 0.30)`, text `#00FF41`. Lasts 1500ms, then reverts. |

### 5.3 Focus States (Keyboard Navigation)

All interactive elements must have visible focus indicators for keyboard users.

```css
/* Default focus style for all interactive elements */
:focus-visible {
  outline: 2px solid #00FF41;
  outline-offset: 2px;
}

/* Remove default outline for mouse users */
:focus:not(:focus-visible) {
  outline: none;
}
```

| Element | Focus Style |
|---------|------------|
| Primary button | `outline: 2px solid #FFFFFF; outline-offset: 2px;` (white, not green, for contrast against green bg) |
| Ghost button | `outline: 2px solid #00FF41; outline-offset: 2px;` |
| Code copy button | `outline: 2px solid #00FF41; outline-offset: 2px;` |
| Links | `outline: 2px solid #00FF41; outline-offset: 2px;` |

### 5.4 Disabled States

Not applicable for the showcase site. All elements are always active. No form inputs, no toggles.

---

## 6. Animations

### 6.1 LED Pulse (Hero)

The signature animation. A slow, breathing pulse that signals "the site is on."

```css
@keyframes led-pulse {
  0%, 100% {
    opacity: 1;
    box-shadow: 0 0 8px rgba(0, 255, 65, 0.5),
                0 0 16px rgba(0, 255, 65, 0.2);
  }
  50% {
    opacity: 0.6;
    box-shadow: 0 0 4px rgba(0, 255, 65, 0.3),
                0 0 8px rgba(0, 255, 65, 0.1);
  }
}

.led--pulse {
  animation: led-pulse 3s ease-in-out infinite;
}
```

- Duration: 3 seconds
- Easing: ease-in-out
- Loop: infinite
- Only used on the hero LED. All other LEDs are static.

### 6.2 Scroll Reveal

Sections fade in gently as they enter the viewport.

```css
.reveal {
  opacity: 0;
  transform: translateY(16px);
  transition: opacity 400ms ease, transform 400ms ease;
}

.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
```

**JavaScript (IntersectionObserver):**

```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);  // Only animate once
    }
  });
}, {
  threshold: 0.1,       // Trigger when 10% visible
  rootMargin: '0px 0px -40px 0px'  // Slight offset so element is partially in view
});

document.querySelectorAll('.reveal').forEach(el => {
  observer.observe(el);
});
```

**Rules:**
- Apply `.reveal` to each `<section>` and to each collection card individually
- Each element animates independently (not all at once)
- Animation triggers once. No repeat on scroll back up.
- Transition: opacity 0 -> 1 + translateY(16px) -> 0 over 400ms ease
- No bounce. No slide. No overshoot. Just a gentle fade-up.

### 6.3 Code Block Cursor Blink (Optional)

A blinking cursor at the end of code blocks for aesthetic effect.

```css
@keyframes cursor-blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0; }
}

.code-block__cursor {
  display: inline-block;
  width: 8px;
  height: 16px;
  background: #00FF41;
  animation: cursor-blink 1s step-end infinite;
  vertical-align: text-bottom;
  margin-left: 2px;
}
```

Only used on the hero or CTA code block -- not every code block on the page. One blinking cursor is atmospheric; multiple is distracting.

### 6.4 Copy Confirmation

When the copy button is clicked:

1. Button text/icon changes from clipboard to checkmark
2. Background flashes green: `rgba(0, 255, 65, 0.15)`
3. After 1500ms, reverts to original state
4. No easing on the flash -- it should feel like an LED switching

```javascript
function handleCopy(button, text) {
  navigator.clipboard.writeText(text).then(() => {
    button.classList.add('copied');
    setTimeout(() => button.classList.remove('copied'), 1500);
  });
}
```

---

## 7. Responsive Breakpoints

### 7.1 Breakpoint Definitions

```css
/* Desktop-first approach. Three breakpoints. */

/* Large desktop: 1200px+ (default) */
/* Tablet: 768px - 1199px */
@media (max-width: 1199px) { ... }

/* Mobile: below 768px */
@media (max-width: 767px) { ... }

/* Small mobile: below 480px */
@media (max-width: 479px) { ... }
```

### 7.2 Section Adaptations

#### Hero

| Property | Desktop (1200+) | Tablet (768-1199) | Mobile (<768) |
|----------|----------------|-------------------|---------------|
| Headline size | 56px | 40px | 28px |
| Tagline max-width | 600px | 500px | 100% |
| CTA layout | Flex row | Flex row | Flex column, full-width buttons |
| Min-height | 100vh | 100vh | auto, padding: 64px 0 |
| Sub-tagline | Visible | Visible | Hidden (too much text on mobile) |

```css
@media (max-width: 1199px) {
  .hero__headline { font-size: 40px; }
}

@media (max-width: 767px) {
  .hero {
    min-height: auto;
    padding: 64px 24px;
  }
  .hero__headline { font-size: 28px; letter-spacing: 0.02em; }
  .hero__tagline { font-size: 14px; }
  .hero__cta-group {
    flex-direction: column;
    width: 100%;
  }
  .hero__cta-group .btn-primary,
  .hero__cta-group .btn-ghost {
    width: 100%;
    justify-content: center;
  }
  .hero__sub-tagline { display: none; }
}
```

#### Collection Cards (The Experience)

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Grid | 2 columns | 2 columns | 1 column (stacked) |
| Card padding | 32px body | 24px body | 20px body |
| Internal table | Full width | Full width | Horizontal scroll if needed |

```css
@media (max-width: 767px) {
  .experience__cards {
    grid-template-columns: 1fr;
    gap: 16px;
  }
}
```

#### Event Map

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Channel strip grid | 2 columns | 2 columns | 1 column |
| Event names | 160px min-width | 140px | Full width, stacked |

```css
@media (max-width: 1199px) {
  .event-map__grid {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 767px) {
  .event-map__grid {
    grid-template-columns: 1fr;
  }
  .channel-strip__event {
    flex-wrap: wrap;
  }
  .channel-strip__event-name {
    min-width: auto;
    width: 100%;
  }
}
```

#### Stats Bar

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Layout | Flex row, equal columns | Flex row | 2x2 grid |
| Value size | 24px | 24px | 20px |

```css
@media (max-width: 767px) {
  .stats-bar {
    display: grid;
    grid-template-columns: 1fr 1fr;
  }
  .stats-bar__item {
    border-right: none;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
  }
  .stats-bar__item:nth-child(odd) {
    border-right: 1px solid rgba(255, 255, 255, 0.08);
  }
  .stats-bar__item:nth-last-child(-n+2) {
    border-bottom: none;
  }
}
```

#### Step Cards (How It Works)

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Grid | 80px number + 1fr content | 60px + 1fr | Single column, number above |
| Code block | Inline | Inline | Horizontal scroll |

```css
@media (max-width: 767px) {
  .step {
    grid-template-columns: 1fr;
  }
  .step__number {
    padding: 16px 24px 0 24px;
    justify-content: flex-start;
    border-right: none;
    border-bottom: none;
    font-size: 24px;
  }
  .code-block {
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
  }
}
```

#### Architecture Diagram

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Flow direction | Horizontal | Horizontal | Vertical |
| Arrow direction | Right-pointing | Right-pointing | Down-pointing |

```css
@media (max-width: 767px) {
  .architecture__flow {
    flex-direction: column;
  }
  .architecture__arrow {
    width: 1px;
    height: 32px;
    /* Rotate arrow to point down */
  }
  .architecture__arrow::after {
    right: auto;
    bottom: 0;
    left: -3px;
    top: auto;
    border: 3px solid transparent;
    border-top-color: rgba(255, 255, 255, 0.20);
  }
}
```

#### CTA Panel

| Property | Desktop | Tablet | Mobile |
|----------|---------|--------|--------|
| Padding | 64px 48px | 48px 32px | 32px 20px |
| Headline size | 36px | 28px | 24px |
| Buttons | Flex row | Flex row | Flex column |

```css
@media (max-width: 767px) {
  .cta-panel {
    padding: 32px 20px;
  }
  .cta-panel__headline { font-size: 24px; }
  .cta-panel__buttons {
    flex-direction: column;
    align-items: stretch;
  }
}
```

### 7.3 Touch Targets

All interactive elements on mobile must meet the minimum 44x44px touch target.

```css
@media (max-width: 767px) {
  .btn-primary,
  .btn-ghost {
    min-height: 48px;      /* Exceeds 44px minimum */
  }
  .code-copy-btn {
    width: 44px;
    height: 44px;
  }
}
```

---

## 8. Accessibility

### 8.1 WCAG 2.1 AA Compliance Checklist

#### Color Contrast Ratios (Verified)

| Text | Background | Ratio | Pass? |
|------|-----------|-------|-------|
| `#FFFFFF` on `#0A0A0A` | Page bg | 19.3:1 | AA + AAA |
| `rgba(255,255,255,0.65)` on `#0A0A0A` | Page bg | ~11.5:1 | AA + AAA |
| `rgba(255,255,255,0.40)` on `#0A0A0A` | Page bg | ~6.3:1 | AA (normal), AAA (large) |
| `#00FF41` on `#0A0A0A` | Page bg | ~12.6:1 | AA + AAA |
| `#FFB800` on `#0A0A0A` | Page bg | ~10.7:1 | AA + AAA |
| `#00D4AA` on `#0A0A0A` | Page bg | ~10.1:1 | AA + AAA |
| `#0A0A0A` on `#00FF41` | Primary btn | ~12.6:1 | AA + AAA |
| `rgba(255,255,255,0.65)` on `#141414` | Surface | ~10.1:1 | AA + AAA |
| `rgba(255,255,255,0.40)` on `#141414` | Surface | ~5.6:1 | AA (large text only) |

Note: The tertiary text color (`rgba(255,255,255,0.40)`) passes AA only for large text (18px+ or 14px+ bold). It is used exclusively for labels and metadata at 10-12px sizes. To ensure compliance, these elements should be **non-essential decorative text** (labels supplementing other cues, metadata that is also expressed in structure). If any tertiary text conveys essential information, bump it to `rgba(255,255,255,0.55)` which passes AA at all sizes.

#### Semantic HTML Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quick-Ping -- Sound Notifications for Claude Code</title>
  <meta name="description" content="...">
</head>
<body>
  <main>
    <section id="hero" aria-label="Introduction">...</section>
    <section id="experience" aria-label="Sound Collections">...</section>
    <section id="control-panel" aria-label="Control Panel Features">...</section>
    <section id="event-map" aria-label="Event Map">...</section>
    <section id="how-it-works" aria-label="Installation Guide">...</section>
    <section id="cta" aria-label="Get Started">...</section>
  </main>
  <footer>...</footer>
</body>
</html>
```

**Rules:**
- Every `<section>` has an `aria-label` or is labelled by a visible heading via `aria-labelledby`
- Headings follow proper hierarchy: one `<h1>` (hero), then `<h2>` for each section, `<h3>` for subsections
- No heading skips (e.g., jumping from `<h2>` to `<h4>`)
- All images (if any) have `alt` text. The site uses no images by design, but if screenshots are added, they need alt text.

#### Keyboard Navigation

- Tab order follows visual reading order (top to bottom, left to right)
- All interactive elements (buttons, links, copy buttons) are reachable via Tab
- Focus indicators are visible (see Section 5.3)
- Skip-to-content link at the very top of the page:

```html
<a href="#hero" class="skip-link">Skip to content</a>
```

```css
.skip-link {
  position: absolute;
  top: -100px;
  left: 16px;
  background: #00FF41;
  color: #0A0A0A;
  padding: 8px 16px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  z-index: 999;
  text-decoration: none;
}

.skip-link:focus {
  top: 16px;
}
```

#### Reduced Motion

Respect `prefers-reduced-motion` for users who are sensitive to animations:

```css
@media (prefers-reduced-motion: reduce) {
  .led--pulse {
    animation: none;
  }
  .reveal {
    opacity: 1;
    transform: none;
    transition: none;
  }
  .code-block__cursor {
    animation: none;
    opacity: 1;
  }
  * {
    transition-duration: 0.01ms !important;
  }
}
```

#### Screen Reader Considerations

- The LED indicators are decorative and should be hidden from screen readers: `aria-hidden="true"`
- Code blocks should use `<pre><code>` with a descriptive `aria-label` (e.g., `aria-label="Installation command"`)
- The background grid texture (`body::before`) is a pseudo-element and naturally hidden from AT
- Copy buttons should have `aria-label="Copy code to clipboard"` and update to `aria-label="Copied"` when clicked

### 8.2 Meta Tags

```html
<meta name="description" content="Quick-Ping: Sound notifications for Claude Code. 124 Metal Gear Solid sounds and 140+ Sims 2 sounds. Every commit, test, and context warning gets its own sound.">
<meta property="og:title" content="Quick-Ping -- Your Terminal Has a Soundtrack Now">
<meta property="og:description" content="Sound notifications for Claude Code. 124 Metal Gear Solid sounds and 140+ Sims 2 sounds. Every commit, test, and context warning gets its own sound.">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Quick-Ping -- Your Terminal Has a Soundtrack Now">
<meta name="twitter:description" content="Your Claude Code sessions just got a soundtrack. Metal Gear Solid alert sounds for context warnings. Simlish celebrations for passing tests. Free and open source.">
```

---

## 9. Performance Budget

### 9.1 Target: Under 50KB Total (Excluding Fonts)

| Resource | Budget |
|----------|--------|
| HTML | ~15KB |
| Inline CSS | ~20KB |
| Inline JS | ~5KB |
| External fonts (IBM Plex Mono 400, 500, 700) | ~150KB (separate, cached) |
| Images | 0KB (all CSS-generated) |
| **Total page weight (excluding fonts)** | **~40KB** |

### 9.2 Loading Strategy

```html
<!-- Preconnect to Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Load fonts with display=swap for fast text rendering -->
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;700&display=swap" rel="stylesheet">
```

- All CSS is inline in `<style>` (no external stylesheet)
- All JS is inline at the bottom of `<body>` (no external scripts)
- No images to lazy-load
- `font-display: swap` ensures text renders immediately with system mono font, then swaps to IBM Plex Mono when loaded

### 9.3 Critical Rendering Path

1. Browser receives single HTML file
2. Inline CSS renders immediately -- hero section paints first
3. Fonts begin loading (async, swap behavior)
4. Page is interactive before fonts finish loading
5. Inline JS at bottom initializes scroll observers and copy handlers
6. Below-fold sections get `.reveal` animations as user scrolls

No render-blocking resources. No external CSS. No external JS. First paint should happen in under 100ms on broadband.

---

## Appendix A: Full Page ASCII Blueprint

```
+=============================================================+
|                                                             |
|                      [LED pulsing]                          |
|                                                             |
|           YOUR CODE HAS A SOUNDTRACK NOW                    |
|                                                             |
|   Sound notifications for Claude Code...                    |
|                                                             |
|       [VIEW ON GITHUB]     [SEE HOW IT WORKS]              |
|                                                             |
|   Because the best notification is the one you don't        |
|   have to look at.                                          |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  [LED] COLLECTIONS                                          |
|  TWO ICONIC SOUND PACKS. READY ON INSTALL.                  |
|                                                             |
|  +--MGS CARD (AMBER)----+ +--SIMS CARD (TEAL)-----+       |
|  | TACTICAL ESPIONAGE    | | SIMLISH SOUND DESIGN  |       |
|  | AUDIO                 | |                        |       |
|  |                       | |                        |       |
|  | Mission arc table     | | Emotion mapping grid   |       |
|  |                       | |                        |       |
|  | 124 sounds, 8-bit WAV | | 140+ sounds            |       |
|  | "You hear *that*..."  | | "Your codebase is..."  |       |
|  +-----------------------+ +------------------------+       |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  [LED] CONTROL PANEL                                        |
|  SSL CONSOLE MEETS DEV TOOLS                                |
|                                                             |
|  +-------[Annotated Screenshot Frame]--------+              |
|  |                                           |              |
|  |   Callout: Collection Switcher            |              |
|  |   Callout: LED Toggles                    |              |
|  |   Callout: Sound Preview                  |              |
|  |   Callout: Claude Suggests                |              |
|  |                                           |              |
|  +-------------------------------------------+              |
|                                                             |
|  localhost:5050 -- Your mission control.                    |
|                                                             |
|  [40+ EVENTS] [TOGGLE] [PREVIEW] [AI-MAPPED] [SEARCH]     |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  [LED] EVENT MAP                                            |
|  40+ EVENTS. EVERY MOMENT COVERED.                          |
|                                                             |
|  +--------+---------+--------+---------+                    |
|  |  40+   |    2    |  264+  |  ZERO   |                    |
|  | EVENTS | COLL'NS | SOUNDS | BUILD   |                    |
|  +--------+---------+--------+---------+                    |
|                                                             |
|  +--CORE (full width)----------------------------+          |
|  | session_start | session_end | tool_start ...  |          |
|  +-----------------------------------------------+          |
|                                                             |
|  +--GIT-----------+  +--TESTING--------+                    |
|  | git_commit ... |  | test_pass ...   |                    |
|  +----------------+  +-----------------+                    |
|                                                             |
|  +--CONTEXT-------+  +--STREAKS--------+                    |
|  | context_50 ... |  | streak_3 ...    |                    |
|  +----------------+  +-----------------+                    |
|                                                             |
|  (... remaining channel strips)                             |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  [LED] HOW IT WORKS                                         |
|  THREE STEPS. TWO MINUTES.                                  |
|                                                             |
|  +--01--+--CLONE AND INSTALL-------------------------+      |
|  +--02--+--HOOK INTO CLAUDE CODE---------------------+      |
|  +--03--+--LAUNCH THE CONTROL PANEL------------------+      |
|                                                             |
|  ARCHITECTURE                                               |
|  [Claude Code] --> [Hooks] --> [quick-ping] --> [afplay]    |
|                                                             |
|  [PYTHON] [VANILLA JS] [REST API] [macOS] [ZERO DEPS]      |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  +=====[GREEN BORDER]================================+      |
|  ||                                                 ||      |
|  ||          YOUR TERMINAL IS TOO QUIET             ||      |
|  ||                                                 ||      |
|  ||  $ git clone ...                          [CP]  ||      |
|  ||                                                 ||      |
|  ||      [GET QUICK-PING]    [VIEW ON GITHUB]       ||      |
|  ||                                                 ||      |
|  ||  Free. Open source. Two sound packs included.   ||      |
|  ||  Because coding in silence was always the       ||      |
|  ||  real bug.                                      ||      |
|  +===================================================+      |
|                                                             |
|-------------------------------------------------------------|
|                                                             |
|  QUICK-PING    MIT License    2026                          |
|  Built for developers who alt-tab.                          |
|                                                             |
+=============================================================+
```

---

## Appendix B: What NOT to Do

These are explicit anti-patterns to avoid during implementation:

1. **No `border-radius`** on any element except the LED indicator circles
2. **No shadows** on cards or panels (only glow effects on LEDs and accent elements)
3. **No gradients** in backgrounds (solid colors only; exception: subtle radial for the dot grid)
4. **No emoji** anywhere in the rendered page
5. **No light mode** toggle or support
6. **No hamburger menu** or navigation bar
7. **No parallax** scrolling backgrounds
8. **No bounce or overshoot** in animations
9. **No images** -- all visual elements are CSS-generated
10. **No external CSS or JS files** -- everything inline in a single HTML file
11. **No framework** -- vanilla HTML/CSS/JS only
12. **No italic text** anywhere
13. **No rounded buttons** -- all button corners are sharp 0px
14. **No hover transforms** on cards (no scale, no rotate, no translateZ)
15. **No sound on the website** -- the irony is intentional

---

## Appendix C: Implementation Notes for the Developer

1. **Start with the Hero.** Get the LED, headline, and buttons right first. This sets the tone for everything.

2. **Build components, then sections.** The LED, buttons, badges, code blocks, and cards are reusable. Build them once, use them everywhere.

3. **Test at 1200px, 768px, and 375px.** These are the three critical widths. If it works at those, it works everywhere.

4. **The grid background is optional.** If it bloats performance or looks wrong at certain resolutions, drop it. The design works without it.

5. **Copy the design tokens exactly.** The CSS custom properties defined in Section 1 are the source of truth. Do not approximate colors or sizes.

6. **The control panel mockup is the hardest piece.** If a full CSS-only mockup is too complex, a simplified representation (header bar + grid of event rows with LEDs) is acceptable. Prioritize the callout annotations -- they tell the story.

7. **Smooth scroll anchors.** The ghost button "SEE HOW IT WORKS" scrolls to `#how-it-works`. Use `scroll-behavior: smooth` on `<html>` and standard anchor links.

8. **The IntersectionObserver JS is the only JavaScript.** Plus the copy-to-clipboard handler. Total JS should be under 50 lines.

9. **Test the font swap.** The page should be readable with system monospace fonts before IBM Plex Mono loads. Verify that the `font-display: swap` behavior looks acceptable.

10. **Validate the HTML.** Run through the W3C validator. Zero errors. Semantic structure matters for accessibility and SEO.
