# 🤖 Jack - Complete Agent Backup & One-Click Restore

> **Your personal AI agent, fully backed up and ready to restore**

This repository contains **everything needed** to restore Jack, a Clawdbot AI agent, with a single command.

## 🎯 What's Included

- ✅ **Complete agent workspace** (personality, memory, configuration)
- ✅ **Clawdbot configuration** (models, providers, settings)
- ✅ **One-click installation script** (handles all dependencies)
- ✅ **All skills and capabilities** (automatically included with Clawdbot)

## 🚀 One-Click Restore

**On Linux/macOS:**

```bash
git clone https://github.com/Yash-AIML/jack-agent-backup.git
cd jack-agent-backup
sudo bash install.sh
```

That's it! The script will:
1. Install Node.js and dependencies
2. Install Clawdbot globally
3. Restore Jack's workspace and configuration
4. Start the gateway
5. Jack is ready to chat!

## 📋 Manual Installation (if you prefer)

<details>
<summary>Click to expand manual steps</summary>

### 1. Install Prerequisites

```bash
# Install Node.js (LTS version)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt-get install -y nodejs

# Install pnpm
npm install -g pnpm
```

### 2. Install Clawdbot

```bash
pnpm install -g clawdbot
```

### 3. Restore Configuration

```bash
# Create directories
mkdir -p ~/clawd
mkdir -p ~/.clawdbot

# Copy workspace files
cp -r workspace/* ~/clawd/

# Copy configuration
cp config/clawdbot.json ~/.clawdbot/
cp config/gateway.env ~/.clawdbot/
chmod 600 ~/.clawdbot/clawdbot.json
```

### 4. Start Clawdbot

```bash
cd ~/clawd
clawdbot gateway start
```

### 5. Chat with Jack

```bash
clawdbot chat
```

</details>

## 📂 Repository Structure

```
jack-agent-backup/
├── install.sh           # One-click installation script
├── README.md           # This file
├── workspace/          # Jack's agent workspace
│   ├── AGENTS.md       # Workspace rules and conventions
│   ├── SOUL.md         # Jack's personality and behavior
│   ├── USER.md         # Information about you (Yash)
│   ├── IDENTITY.md     # Jack's identity details
│   ├── TOOLS.md        # Local tool configurations
│   ├── HEARTBEAT.md    # Periodic task configuration
│   └── BOOTSTRAP.md    # First-run setup (usually deleted after setup)
└── config/             # Clawdbot configuration
    ├── clawdbot.json   # Main configuration (models, gateway, etc.)
    └── gateway.env     # Gateway environment variables
```

## 🔧 What Gets Restored

### Agent Workspace (`workspace/`)
- **Personality & Behavior** - Jack's core identity and how he responds
- **User Context** - Information about you and your preferences
- **Memory System** - Framework for maintaining continuity across sessions
- **Tool Configurations** - Local settings for skills and integrations

### Clawdbot Configuration (`config/`)
- **Model Providers** - AI model endpoints (GPT-5.2, Claude Sonnet, etc.)
- **Gateway Settings** - Local server configuration
- **Agent Defaults** - Primary model, workspace location, aliases

### Built-in Skills (automatically included)
Clawdbot comes with 50+ skills including:
- GitHub integration (`gh` CLI)
- Weather forecasts
- Web search and fetch
- Browser automation
- File operations
- Messaging (Telegram, WhatsApp, Discord, etc.)
- And many more...

## 🛡️ Security Notes

**⚠️ Important:**
- `config/clawdbot.json` contains API keys and tokens
- This repo should be **private** if it contains sensitive information
- After restore, consider rotating any tokens/keys for security
- The install script requires `sudo` for system-level dependencies

**What's safe to share publicly:**
- Workspace files (`AGENTS.md`, `SOUL.md`, etc.) - unless they contain personal info
- Installation scripts
- Documentation

**What to keep private:**
- `config/clawdbot.json` - contains API keys
- `config/gateway.env` - contains gateway tokens
- Any files with credentials or personal information

## 📖 Usage After Restore

### Start the gateway:
```bash
clawdbot gateway start
```

### Chat with Jack:
```bash
cd ~/clawd
clawdbot chat
```

### Check status:
```bash
clawdbot status
```

### Access web dashboard:
```
http://localhost:18789
```

### Stop the gateway:
```bash
clawdbot gateway stop
```

## 🔄 Keeping Backups Updated

To update this backup with new changes:

```bash
cd ~/clawd
git add .
git commit -m "Update Jack's configuration"
git push
```

## 📚 Learn More

- **Clawdbot Documentation**: https://docs.clawd.bot
- **Clawdbot Source**: https://github.com/clawdbot/clawdbot
- **Community Discord**: https://discord.com/invite/clawd
- **Find More Skills**: https://clawdhub.com

## 🆘 Troubleshooting

### Permission denied errors
```bash
sudo chown -R $USER ~/.clawdbot
chmod 600 ~/.clawdbot/clawdbot.json
```

### Gateway won't start
```bash
clawdbot gateway stop
clawdbot gateway start
```

### Check logs
```bash
clawdbot status
journalctl -u clawdbot-gateway -f  # If using systemd
```

## 💡 About Jack

Jack is a Clawdbot AI agent configured to be:
- **Helpful but not performative** - Gets things done without filler
- **Opinionated** - Has preferences and personality
- **Resourceful** - Tries to figure things out before asking
- **Trustworthy** - Careful with external actions, bold internally
- **Continuous** - Uses memory files to maintain context across sessions

---

**Created by**: Yash  
**Agent**: Jack  
**Platform**: Clawdbot  
**Backup Date**: 2026-02-21

*If you have questions or issues, check the Clawdbot docs or Discord community.*
