#!/bin/sh
# Railway startup script for OpenClaw

# Ensure HOME is set correctly
export HOME=/home/node

# Create config directory
mkdir -p "$HOME/.openclaw"

# Write config file with trusted proxies and WhatsApp enabled
cat > "$HOME/.openclaw/openclaw.json" << 'EOF'
{
  "gateway": {
    "controlUi": {
      "enabled": true,
      "dangerouslyDisableDeviceAuth": true
    },
    "trustedProxies": ["100.64.0.0/10", "10.0.0.0/8", "172.16.0.0/12"]
  },
  "channels": {
    "whatsapp": {
      "enabled": true,
      "provider": "baileys"
    }
  }
}
EOF

# Debug: Show the config
echo "Config written to $HOME/.openclaw/openclaw.json:"
cat "$HOME/.openclaw/openclaw.json"

# Config is auto-detected from ~/.openclaw/openclaw.json
exec node dist/index.js gateway --allow-unconfigured --port 3000 --bind lan
