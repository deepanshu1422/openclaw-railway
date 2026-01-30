#!/bin/sh
# Railway startup script for OpenClaw

# Create config directory
mkdir -p /home/node/.openclaw

# Write config file with trusted proxies and open webchat
cat > /home/node/.openclaw/config.json << 'EOF'
{
  "gateway": {
    "controlUi": {
      "enabled": true,
      "dangerouslyDisableDeviceAuth": true
    },
    "trustedProxies": ["100.64.0.0/10", "10.0.0.0/8", "172.16.0.0/12"]
  },
  "docking": {
    "webchat": {
      "allowFrom": ["*"]
    }
  }
}
EOF

# Set config path and start gateway
export OPENCLAW_CONFIG_PATH=/home/node/.openclaw/config.json
exec node dist/index.js gateway --allow-unconfigured --port 3000 --bind lan
