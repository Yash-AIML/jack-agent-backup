#!/bin/bash
# Jack Agent - One-Click Restore Script
# This script installs Clawdbot and restores Jack's complete configuration

set -e  # Exit on any error

echo "========================================"
echo "   Jack Agent - One-Click Restore"
echo "========================================"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  This script needs root/sudo access for system setup"
    echo "Please run: sudo bash install.sh"
    exit 1
fi

# Detect package manager
if command -v apt-get &> /dev/null; then
    PKG_MANAGER="apt-get"
elif command -v yum &> /dev/null; then
    PKG_MANAGER="yum"
elif command -v brew &> /dev/null; then
    PKG_MANAGER="brew"
else
    echo "❌ Could not detect package manager (apt/yum/brew)"
    exit 1
fi

echo "📦 Installing dependencies..."

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    if [ "$PKG_MANAGER" = "apt-get" ]; then
        curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
        apt-get install -y nodejs
    elif [ "$PKG_MANAGER" = "yum" ]; then
        curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash -
        yum install -y nodejs
    elif [ "$PKG_MANAGER" = "brew" ]; then
        brew install node
    fi
fi

# Install pnpm if not present
if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    npm install -g pnpm
fi

echo "✅ Dependencies installed"
echo ""

# Install Clawdbot
echo "📥 Installing Clawdbot..."
pnpm install -g clawdbot

echo "✅ Clawdbot installed"
echo ""

# Setup directories
echo "🔧 Setting up workspace..."
CLAWD_HOME="$HOME/clawd"
CLAWDBOT_CONFIG="$HOME/.clawdbot"

mkdir -p "$CLAWD_HOME"
mkdir -p "$CLAWDBOT_CONFIG"

# Copy agent workspace files
echo "📋 Restoring Jack's workspace..."
cp -r ./workspace/* "$CLAWD_HOME/"

# Copy configuration
echo "⚙️  Restoring configuration..."
if [ -f ./config/clawdbot.json ]; then
    cp ./config/clawdbot.json "$CLAWDBOT_CONFIG/"
    chmod 600 "$CLAWDBOT_CONFIG/clawdbot.json"
fi

if [ -f ./config/gateway.env ]; then
    cp ./config/gateway.env "$CLAWDBOT_CONFIG/"
    chmod 600 "$CLAWDBOT_CONFIG/gateway.env"
fi

echo "✅ Configuration restored"
echo ""

# Start Clawdbot
echo "🚀 Starting Clawdbot..."
cd "$CLAWD_HOME"
clawdbot gateway start

echo ""
echo "========================================"
echo "   ✅ Jack is back online!"
echo "========================================"
echo ""
echo "🌐 Dashboard: http://localhost:18789"
echo "📁 Workspace: $CLAWD_HOME"
echo "⚙️  Config: $CLAWDBOT_CONFIG"
echo ""
echo "To chat with Jack:"
echo "  cd $CLAWD_HOME"
echo "  clawdbot chat"
echo ""
echo "To check status:"
echo "  clawdbot status"
echo ""
