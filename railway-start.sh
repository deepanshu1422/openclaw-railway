#!/bin/sh
# Railway startup script for OpenClaw

# Create config directory
mkdir -p /home/node/.openclaw

# Write config file with trusted proxies (must be named openclaw.json)
cat > /home/node/.openclaw/openclaw.json << 'EOF'
{
  "gateway": {
    "controlUi": {
      "enabled": true,
      "dangerouslyDisableDeviceAuth": true
    },
    "trustedProxies": ["100.64.0.0/10", "10.0.0.0/8", "172.16.0.0/12"]
  }
}
EOF

# Config is auto-detected from ~/.openclaw/openclaw.json
exec node dist/index.js gateway --allow-unconfigured --port 3000 --bind lan
