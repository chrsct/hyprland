#!/usr/bin/env bash
WALLPAPER_PATH="$1"

if [ -z "$WALLPAPER_PATH" ]; then
    echo "No wallpaper path provided."
    exit 1
fi

# Kill old swaybg instances
killall swaybg 2>/dev/null

# Apply wallpaper in background
swaybg -i "$WALLPAPER_PATH" -m fill &

# Save active wallpaper path for auto-start
echo "$WALLPAPER_PATH" > ~/.config/hypr/current_wallpaper
killall exodus 
