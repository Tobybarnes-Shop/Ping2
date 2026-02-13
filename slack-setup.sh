#!/bin/bash
# Slack Notification Setup for Claude Code

QUICK_PING_DIR="${QUICK_PING_DIR:-$HOME/.quick-ping}"
CONFIG_FILE="$QUICK_PING_DIR/slack-config.json"
CLAUDE_SETTINGS="${CLAUDE_SETTINGS_FILE:-$HOME/.claude/settings.json}"

echo "🔔 Claude Code Slack Notifications Setup"
echo ""

# Get webhook URL
echo "Enter your Slack Webhook URL:"
echo "(Get one from: https://api.slack.com/messaging/webhooks)"
read -r WEBHOOK_URL

if [[ -z "$WEBHOOK_URL" ]]; then
    echo "Error: Webhook URL required"
    exit 1
fi

# Save config
cat > "$CONFIG_FILE" <<EOF
{
  "webhook_url": "$WEBHOOK_URL",
  "enabled_events": [
    "SessionStart",
    "SessionEnd",
    "SubagentStart",
    "SubagentStop",
    "Stop",
    "TaskCompleted",
    "PostToolUse",
    "PostToolUseFailure",
    "PermissionRequest"
  ]
}
EOF

echo "✓ Config saved to $CONFIG_FILE"
echo ""
echo "📋 Next steps:"
echo ""
echo "Add these hooks to $CLAUDE_SETTINGS:"
echo ""
cat <<'HOOKS'
{
  "hooks": {
    "SessionStart": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SessionEnd": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SubagentStart": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SubagentStop": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "Stop": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "TaskCompleted": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PostToolUse": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PostToolUseFailure": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PermissionRequest": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh"
  }
}
HOOKS

echo ""
echo "Would you like me to automatically add these hooks? (y/n)"
read -r AUTO_INSTALL

if [[ "$AUTO_INSTALL" == "y" ]]; then
    # Backup existing settings
    cp "$CLAUDE_SETTINGS" "$CLAUDE_SETTINGS.backup-$(date +%s)"

    # Add hooks using Python
    python3 <<PYTHON
import json
import sys

settings_file = "$CLAUDE_SETTINGS"
with open(settings_file, 'r') as f:
    settings = json.load(f)

if 'hooks' not in settings:
    settings['hooks'] = {}

# Add Slack notification hooks
slack_hooks = {
    "SessionStart": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SessionEnd": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SubagentStart": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "SubagentStop": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "Stop": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "TaskCompleted": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PostToolUse": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PostToolUseFailure": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh",
    "PermissionRequest": "~/Documents/MyEP/projects/noisy-claude/slack-notify.sh"
}

settings['hooks'].update(slack_hooks)

with open(settings_file, 'w') as f:
    json.dump(settings, f, indent=2)

print("✓ Hooks added to Claude settings")
PYTHON

    echo ""
    echo "✅ Setup complete! Restart Claude Code for hooks to take effect."
else
    echo ""
    echo "Manual setup: Copy the hooks above into your $CLAUDE_SETTINGS"
fi
