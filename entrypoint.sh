#!/bin/sh
# Render/Koyeb/Zeabur 等平台会自动注入 $PORT；UUID / WS_PATH 在平台 dashboard 设为环境变量
PORT=${PORT:-10000}
if [ -z "$UUID" ] || [ -z "$WS_PATH" ]; then
  echo "FATAL: UUID and WS_PATH env vars must be set" >&2
  exit 1
fi
cat > /app/config.json <<CFGEOF
{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [ { "id": "${UUID}", "flow": "" } ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": { "path": "${WS_PATH}" }
      },
      "sniffing": { "enabled": true, "destOverride": ["http", "tls"] }
    }
  ],
  "outbounds": [ { "protocol": "freedom" } ]
}
CFGEOF
exec /app/xray run -c /app/config.json
