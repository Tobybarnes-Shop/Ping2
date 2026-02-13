#!/usr/bin/env bash
# Quick-Ping 2 Installer
# One-line installation for macOS

set -e

echo "🎚️  Quick-Ping 2 Installer"
echo ""

# Check for macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This installer is for macOS only"
    exit 1
fi

# Check for Python 3
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is required but not found"
    echo "   Install with: brew install python3"
    exit 1
fi

# Installation directory
INSTALL_DIR="$HOME/Documents/MyEP/Projects/quick-ping-2"

echo "📁 Installing to: $INSTALL_DIR"
echo ""

# Create directory structure
mkdir -p "$HOME/Documents/MyEP/Projects"

# Clone or download
if [ -d "$INSTALL_DIR" ]; then
    echo "⚠️  Directory already exists. Updating..."
    cd "$INSTALL_DIR"
    git pull origin main || echo "Not a git repo, skipping update"
else
    echo "📥 Cloning from GitHub..."
    git clone https://github.com/Tobybarnes-Shop/Ping2.git "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Install Python dependencies
echo ""
echo "📦 Installing dependencies..."
pip3 install flask flask-cors --quiet || pip3 install --user flask flask-cors --quiet

# Make scripts executable
chmod +x *.sh 2>/dev/null || true

# Check if Claude Code hooks need updating
CLAUDE_SETTINGS="$HOME/.claude/settings.json"

if [ -f "$CLAUDE_SETTINGS" ]; then
    echo ""
    echo "🔧 Claude Code detected!"

    # Check if hooks already configured
    if grep -q "quick-ping" "$CLAUDE_SETTINGS"; then
        echo "   Hooks already configured ✓"
    else
        echo ""
        echo "⚠️  To enable sound notifications, add these hooks to ~/.claude/settings.json:"
        echo ""
        cat << 'EOF'
{
  "hooks": {
    "PreToolUse": [{
      "matcher": ".*",
      "hooks": [{
        "type": "command",
        "command": "~/Documents/MyEP/projects/quick-ping-2/quick-ping-v2.sh",
        "async": true,
        "timeout": 5
      }]
    }],
    "PostToolUse": [{
      "matcher": ".*",
      "hooks": [{
        "type": "command",
        "command": "~/Documents/MyEP/projects/quick-ping-2/quick-ping-v2.sh",
        "async": true,
        "timeout": 5
      }]
    }],
    "Stop": [{
      "hooks": [{
        "type": "command",
        "command": "~/Documents/MyEP/projects/quick-ping-2/quick-ping-v2.sh",
        "async": true,
        "timeout": 5
      }]
    }]
  }
}
EOF
        echo ""
    fi
else
    echo ""
    echo "ℹ️  Claude Code not detected. Install hooks manually if needed."
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "🚀 Next steps:"
echo ""
echo "   1. Launch control panel:"
echo "      ~/Documents/MyEP/projects/quick-ping-2/launch-control-panel.sh"
echo ""
echo "   2. Open in browser:"
echo "      http://localhost:5050"
echo ""
echo "   3. Configure your sound events!"
echo ""
echo "📚 Documentation: $INSTALL_DIR/README.md"
echo "🌐 GitHub: https://github.com/Tobybarnes-Shop/Ping2"
echo ""
