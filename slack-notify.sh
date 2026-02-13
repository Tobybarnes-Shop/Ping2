#!/bin/bash
# Claude Code Slack Notifications
# Sends Slack messages when Claude Code hooks fire

QUICK_PING_DIR="${QUICK_PING_DIR:-$HOME/.quick-ping}"
CONFIG_FILE="$QUICK_PING_DIR/slack-config.json"

# Read Slack webhook URL from config
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: Slack config not found. Run setup first."
    exit 1
fi

WEBHOOK_URL=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE'))['webhook_url'])" 2>/dev/null)

if [[ -z "$WEBHOOK_URL" ]]; then
    echo "Error: Slack webhook URL not configured"
    exit 1
fi

# Get hook event from stdin (Claude Code passes JSON)
read -r HOOK_DATA

# Extract event name
EVENT_NAME=$(echo "$HOOK_DATA" | python3 -c "import json,sys; print(json.load(sys.stdin).get('hook_event_name','unknown'))" 2>/dev/null)

# Build Slack message based on event
case "$EVENT_NAME" in
    SessionStart)
        MESSAGE="🚀 *Claude Code session started*"
        COLOR="good"
        ;;
    SessionEnd)
        MESSAGE="🛑 *Claude Code session ended*"
        COLOR="#808080"
        ;;
    SubagentStart)
        MESSAGE="🤖 *Subagent spawned* - Agent is starting work"
        COLOR="#36a64f"
        ;;
    SubagentStop)
        MESSAGE="✅ *Subagent finished* - Agent completed work"
        COLOR="good"
        ;;
    Stop)
        MESSAGE="💬 *Claude finished responding*"
        COLOR="#439FE0"
        ;;
    TaskCompleted)
        MESSAGE="✓ *Task marked completed*"
        COLOR="good"
        ;;
    PostToolUse)
        TOOL_NAME=$(echo "$HOOK_DATA" | python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_name','unknown'))" 2>/dev/null)
        MESSAGE="🔧 *Tool succeeded:* \`$TOOL_NAME\`"
        COLOR="good"
        ;;
    PostToolUseFailure)
        TOOL_NAME=$(echo "$HOOK_DATA" | python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_name','unknown'))" 2>/dev/null)
        MESSAGE="⚠️ *Tool failed:* \`$TOOL_NAME\`"
        COLOR="danger"
        ;;
    PermissionRequest)
        MESSAGE="🔐 *Permission requested* - Claude needs approval"
        COLOR="warning"
        ;;
    Notification)
        MESSAGE="🔔 *Claude Code notification*"
        COLOR="warning"
        ;;
    TeammateIdle)
        MESSAGE="😴 *Teammate agent going idle*"
        COLOR="#808080"
        ;;
    UserPromptSubmit)
        MESSAGE="📝 *User submitted prompt*"
        COLOR="#439FE0"
        ;;
    PreCompact)
        MESSAGE="🗜️ *Compacting context*"
        COLOR="#808080"
        ;;
    *)
        MESSAGE="ℹ️ *Claude Code event:* $EVENT_NAME"
        COLOR="#808080"
        ;;
esac

# Add timestamp
TIMESTAMP=$(date "+%H:%M:%S")

# Send to Slack
curl -X POST "$WEBHOOK_URL" \
    -H "Content-Type: application/json" \
    -d "{
        \"attachments\": [{
            \"color\": \"$COLOR\",
            \"text\": \"$MESSAGE\",
            \"footer\": \"Claude Code\",
            \"footer_icon\": \"https://claude.ai/favicon.ico\",
            \"ts\": $(date +%s)
        }]
    }" \
    --silent --output /dev/null

exit 0
