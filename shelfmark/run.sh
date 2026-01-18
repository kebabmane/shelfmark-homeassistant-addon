#!/usr/bin/env bash
set -e

# Read configuration from Home Assistant
CONFIG_PATH=/data/options.json

if [ -f "$CONFIG_PATH" ]; then
    TIMEZONE=$(python3 -c "import json; print(json.load(open('$CONFIG_PATH')).get('timezone', 'Etc/UTC'))")
    LOG_LEVEL=$(python3 -c "import json; print(json.load(open('$CONFIG_PATH')).get('log_level', 'info'))")
else
    TIMEZONE="Etc/UTC"
    LOG_LEVEL="info"
fi

# Export environment variables
export TZ="${TIMEZONE}"
export LOG_LEVEL="${LOG_LEVEL}"
export FLASK_PORT=8084
export INGEST_DIR=/media/shelfmark
export PUID=0
export PGID=0

# Ensure the download directory exists
mkdir -p /media/shelfmark

# Create symlink for config persistence if not exists
if [ ! -d "/data/config" ]; then
    mkdir -p /data/config
fi

# Link Shelfmark config to persistent storage
if [ -d "/config" ] && [ ! -L "/config" ]; then
    cp -rn /config/* /data/config/ 2>/dev/null || true
    rm -rf /config
    ln -sf /data/config /config
elif [ ! -d "/config" ]; then
    ln -sf /data/config /config
fi

echo "Starting Shelfmark..."
echo "  Timezone: ${TZ}"
echo "  Log Level: ${LOG_LEVEL}"
echo "  Download Directory: ${INGEST_DIR}"
echo "  Port: ${FLASK_PORT}"

# Start the application using the original entrypoint
exec /app/entrypoint.sh
