# 🔊 Quick-Ping Control Panel

A beautiful web interface for managing your Claude Code sound notifications.

## Quick Start

Launch the control panel:

```bash
~/Documents/MyEP/Projects/quick-ping-2/quick-ping-v2.sh --control-panel
```

Or use the launcher directly:

```bash
~/Documents/MyEP/Projects/quick-ping-2/launch-control-panel.sh
```

Then open **http://localhost:5050** in your browser.

## Features

### 📚 Collections System (NEW in v2.0!)
- **Multiple sound libraries** - Manage and switch between different sound collections
- **Easy switching** - Change your entire sound library with one click
- **Smart scanning** - Automatically detect audio files in any folder
- **Intelligent mapping** - Claude suggests sound-to-event mappings based on filenames
- **Theme support** - Create collections for different moods, projects, or contexts

See [COLLECTIONS.md](COLLECTIONS.md) for detailed documentation.

### 🎛️ Event Management
- **Toggle events on/off** with beautiful switches
- **Change sounds** for each event with dropdown selectors
- **Preview sounds** with the play button
- **Search events** with the search box
- **Bulk actions**: Enable All / Disable All

### 🎵 Sound Library
- Browse all available sounds from active collection
- Preview any sound before assigning it
- See which sounds are assigned to which events
- Support for WAV, MP3, AIFF, and M4A formats

### ✨ Claude Suggests
Click the "✨ Claude Suggests" button to get smart, opinionated recommendations:
- Balances useful notifications vs. noise
- Celebrates wins (commits, PR creation, test passes)
- Warns on problems (errors, failures, late-night coding)
- Disables noisy events that fire too frequently

### 🎯 Focus Modes
- **Smart Mode**: Only plays sounds when you're focused elsewhere (not in terminal/editor)
- **Always Mode**: Always plays sounds regardless of focus

### 📊 Live Stats
- Total events tracked
- Currently enabled count
- Available sounds count

## Event Categories

### Core Events
- Session start/end, task completion, permissions

### Agent & Teams
- Subagent lifecycle, team operations, teammate messages

### Git Operations
- Commits, pushes, PR creation, errors

### Testing & Building
- Test passes/failures, build completion/errors

### Performance
- Long task warnings, error thresholds, background tasks

### Context Usage
- Alerts at 50%, 75%, 90% context usage

### Streaks
- Celebrate 3, 5, 10 successful operations in a row

### Time of Day
- Different sounds for morning/afternoon/evening/late-night sessions

### Skills
- Sounds for /commit, /newday, /publish, /deploy-weekly, /gsd

## Commands

```bash
# Launch control panel
quick-ping-v2.sh --control-panel

# Check status (now shows active collection info)
quick-ping-v2.sh --status

# Set focus mode
quick-ping-v2.sh --always
quick-ping-v2.sh --smart

# List all sounds from active collection
quick-ping-v2.sh --list-sounds

# Play a sound from active collection
quick-ping-v2.sh --play mGREETING.wav
```

## Architecture

- **Frontend**: Pure HTML/CSS/JavaScript (no build step required)
- **Backend**: Python Flask server
- **Config**: JSON file at `~/Documents/MyEP/Projects/quick-ping-2/config.json`
- **Sounds**: WAV/MP3 files in `~/Documents/MyEP/Projects/quick-ping-2/sounds/`

## Requirements

- Python 3
- Flask (auto-installed on first launch)
- macOS (uses `afplay` for sound playback)

## Pro Tips

1. **Start with Claude Suggests** - It's a great baseline configuration
2. **Use Smart Mode** - Prevents notification fatigue when you're focused
3. **Disable noisy events** - `tool_success` and thinking events fire very frequently
4. **Celebrate wins** - Keep git operations and test passes enabled for dopamine hits
5. **Context warnings** - Keep 75% and 90% enabled to manage long sessions

## Customization

Edit `config.json` directly or use the web UI. The config file has this structure:

```json
{
  "version": "2.0",
  "focus_mode": "smart",
  "active_collection": "default",
  "collections": {
    "default": {
      "name": "Sims Sounds",
      "path": "/Users/username/.quick-ping/sounds",
      "description": "Original Sims game sounds"
    }
  },
  "events": {
    "event_name": {
      "enabled": true,
      "sound": "sound-file.wav",
      "description": "What this event does"
    }
  }
}
```

### Adding Your Own Sound Collections

1. Put sound files (WAV/MP3/AIFF/M4A) in a folder
2. Open the Control Panel
3. Click "Add Collection"
4. Enter the folder path
5. Click "Scan Folder" to verify
6. Click "Claude Suggests Mappings" for automatic assignments
7. Save and switch to your new collection

See [COLLECTIONS.md](COLLECTIONS.md) for more details.

## Troubleshooting

**Control panel won't start:**
- Make sure Python 3 is installed: `python3 --version`
- Check if port 5050 is available: `lsof -i :5050`

**Sounds not playing:**
- Check focus mode setting
- Test sound playback: `afplay ~/Documents/MyEP/Projects/quick-ping-2/sounds/mGREETING.wav`
- Verify system volume is up

**Events not triggering:**
- Check that the event is enabled in config
- Verify hooks are configured in `~/.claude/settings.json`
- Check that quick-ping-v2.sh is being called from hooks

## Version

Quick-Ping v2.0 with Control Panel
