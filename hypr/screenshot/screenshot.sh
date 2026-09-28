#!/bin/bash

LOCK_FILE="/tmp/screenshot.lock"
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

mkdir -p "$SCREENSHOT_DIR"
if [ -e "$LOCK_FILE" ]; then
    exit 1
fi

touch "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT

FILENAME="$(date +%s_grim.png)"
FULL_PATH="$SCREENSHOT_DIR/$FILENAME"

if grim -g "$(slurp)" "$FULL_PATH"; then
    wl-copy < "$FULL_PATH"
    hyprctl notify 5 3000 "rgb(40a02b)" "Screenshot saved & copied to clipboard!"
else
    hyprctl notify 0 2000 "rgb(df8e1d)" "Screenshot cancelled"
fi

rm "$LOCK_FILE"
