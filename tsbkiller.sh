#!/bin/bash
TARGET_PLACE_ID="10449761463"
SOBER_APP_ID="org.vinegarhq.Sober"
SOBER_DIR="$HOME/.var/app/$SOBER_APP_ID"

while true; do
    if flatpak ps | grep -q "$SOBER_APP_ID"; then
        if grep -rq --include="*.log" "$TARGET_PLACE_ID" "$SOBER_DIR" 2>/dev/null; then
            flatpak kill "$SOBER_APP_ID"
            find "$SOBER_DIR" -type f -name "*.log" -delete 2>/dev/null
        fi
    fi
    sleep 0.5
done
