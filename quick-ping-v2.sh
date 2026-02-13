#!/usr/bin/env bash
# quick-ping-v2.sh — Enhanced Claude Code hook script v2.0
set -euo pipefail

VERSION="2.0"
QUICK_PING_DIR="${QUICK_PING_DIR:-$HOME/Documents/MyEP/projects/quick-ping-2}"
CONFIG_FILE="$QUICK_PING_DIR/config.json"
PID_FILE="$QUICK_PING_DIR/.afplay.pid"
DETECT_SCRIPT="$QUICK_PING_DIR/detect-event.sh"

# CLI commands
case "${1:-}" in
  --version) echo "quick-ping v$VERSION"; exit 0 ;;
  --help|-h) echo "quick-ping v$VERSION"; echo "Docs: https://quick-ping.quick.shopify.io/help.html"; exit 0 ;;
  --always) python3 -c "
import json, os
p = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'config.json')
with open(p) as f: c = json.load(f)
c['focus_mode'] = 'always'
with open(p,'w') as f: json.dump(c,f,indent=2); f.write('\\n')
print('Focus mode: always')
"; exit 0 ;;
  --smart) python3 -c "
import json, os
p = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'config.json')
with open(p) as f: c = json.load(f)
c['focus_mode'] = 'smart'
with open(p,'w') as f: json.dump(c,f,indent=2); f.write('\\n')
print('Focus mode: smart')
"; exit 0 ;;
  --status) python3 -c "
import json, os
p = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'config.json')
with open(p) as f: c = json.load(f)
m = c.get('focus_mode','smart')
v = c.get('version','1.0')
active = c.get('active_collection', 'default')
collections = c.get('collections', {})

print(f'quick-ping v{v}')
print(f'Focus mode: {m}')
print(f'\\nActive collection: {active}')
if active in collections:
    coll = collections[active]
    print(f'  Name: {coll.get(\"name\", \"Unknown\")}')
    print(f'  Path: {coll.get(\"path\", \"Unknown\")}')
    if coll.get('description'):
        print(f'  Description: {coll.get(\"description\")}')

print(f'\\nTotal collections: {len(collections)}')
for cid, coll in collections.items():
    marker = '→' if cid == active else ' '
    print(f'  {marker} {cid}: {coll.get(\"name\", \"Unknown\")}')

print('\\nEnabled events:')
for n,e in c.get('events',{}).items():
    if e.get('enabled'):
        s = e.get('sound','none')
        d = e.get('description','')
        print(f'  ✓ {n:20} → {s:25} # {d}')
print('\\nDisabled events:')
for n,e in c.get('events',{}).items():
    if not e.get('enabled'):
        s = e.get('sound','none')
        d = e.get('description','')
        print(f'  ✗ {n:20} → {s:25} # {d}')
"; exit 0 ;;
  --list-sounds)
    python3 -c "
import json, os
p = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'config.json')
with open(p) as f: config = json.load(f)
active = config.get('active_collection', 'default')
collections = config.get('collections', {})
if active in collections:
    sounds_path = collections[active]['path']
else:
    sounds_path = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'sounds')
import pathlib
for f in sorted(pathlib.Path(sounds_path).glob('*')):
    if f.suffix in ['.wav', '.mp3', '.aiff', '.m4a']:
        print(f.name)
"; exit 0 ;;
  --play)
    if [ -z "${2:-}" ]; then
      echo "Usage: quick-ping-v2.sh --play <sound-file>"
      exit 1
    fi
    SOUND_PATH=$(python3 -c "
import json, os
p = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'config.json')
with open(p) as f: config = json.load(f)
active = config.get('active_collection', 'default')
collections = config.get('collections', {})
if active in collections:
    sounds_path = collections[active]['path']
else:
    sounds_path = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'sounds')
print(os.path.join(sounds_path, '$2'))
")
    afplay "$SOUND_PATH"
    exit 0
    ;;
  --control-panel|--ui|--config)
    echo "🌐 Launching Quick-Ping Control Panel..."
    exec "$QUICK_PING_DIR/launch-control-panel.sh"
    ;;
esac

# Read hook input
INPUT=$(cat)

# Detect events using the detect-event script
if [ ! -f "$DETECT_SCRIPT" ]; then
  # Fall back to original behavior
  EVENT=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('hook_event_name',''))" 2>/dev/null) || exit 0
  case "$EVENT" in
    SessionStart)  EVENTS="session_start" ;;
    Stop)          EVENTS="task_complete" ;;
    Notification)  EVENTS="permission" ;;
    *)             exit 0 ;;
  esac
else
  EVENTS=$(echo "$INPUT" | "$DETECT_SCRIPT") || exit 0
fi

if [ -z "$EVENTS" ]; then
  exit 0
fi

if [ ! -f "$CONFIG_FILE" ]; then exit 1; fi

# Get focus mode
FOCUS_MODE=$(python3 -c "
import sys, json
with open('$CONFIG_FILE') as f: config = json.load(f)
print(config.get('focus_mode', 'smart'))
" 2>/dev/null) || FOCUS_MODE="smart"

# Check focus mode
if [ "$FOCUS_MODE" = "smart" ]; then
  FRONTMOST=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>/dev/null) || FRONTMOST=""
  case "$FRONTMOST" in
    Terminal|iTerm*|Alacritty|kitty|WezTerm|Ghostty|Hyper|Warp|Rio|Tabby|Code|Cursor|Zed|Windsurf) exit 0 ;;
  esac
fi

# Play sound for each detected event
while IFS= read -r EVENT; do
  [ -z "$EVENT" ] && continue

  # Get event config and active collection path
  read -r ENABLED SOUND_FILE SOUNDS_DIR_PATH <<< $(python3 -c "
import sys, json, os
with open('$CONFIG_FILE') as f: config = json.load(f)
event = config.get('events', {}).get('$EVENT', {})

# Get active collection path
active = config.get('active_collection', 'default')
collections = config.get('collections', {})
if active in collections:
    sounds_path = collections[active]['path']
else:
    sounds_path = os.path.join(os.environ.get('QUICK_PING_DIR', os.path.expanduser('~/Documents/MyEP/projects/quick-ping-2')), 'sounds')

print(event.get('enabled', False), event.get('sound', ''), sounds_path)
" 2>/dev/null) || continue

  if [ "$ENABLED" != "True" ]; then continue; fi
  if [ -z "$SOUND_FILE" ]; then continue; fi

  SOUND_PATH="$SOUNDS_DIR_PATH/$SOUND_FILE"
  if [ ! -f "$SOUND_PATH" ]; then continue; fi

  # Kill any existing sound
  if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE" 2>/dev/null) || true
    if [ -n "$OLD_PID" ] && kill -0 "$OLD_PID" 2>/dev/null; then
      kill "$OLD_PID" 2>/dev/null || true
    fi
    rm -f "$PID_FILE"
  fi

  # Play sound
  export QUICK_PING_DIR
  nohup afplay "$SOUND_PATH" >/dev/null 2>&1 &
  AFPLAY_PID=$!
  echo "$AFPLAY_PID" > "$PID_FILE"
  disown "$AFPLAY_PID" 2>/dev/null || true

  # Small delay between sounds if multiple events
  sleep 0.1
done <<< "$EVENTS"

exit 0
