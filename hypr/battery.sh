#!/bin/bash
BAT_PATH=$(upower -e | grep -m 1 bat)

LAST_WARNED_THRESHOLD=0

while true; do
    if [ -n "$BAT_PATH" ]; then
        PERCENTAGE=$(upower -i "$BAT_PATH" | awk '/percentage/{print $2}' | tr -d '%')
        STATE=$(upower -i "$BAT_PATH" | awk '/state/{print $2}')

        if [ "$STATE" = "discharging" ]; then
            CURRENT_THRESHOLD=0
            if [ "$PERCENTAGE" -le 1 ]; then CURRENT_THRESHOLD=1
            elif [ "$PERCENTAGE" -le 5 ]; then CURRENT_THRESHOLD=5
            elif [ "$PERCENTAGE" -le 10 ]; then CURRENT_THRESHOLD=10
            elif [ "$PERCENTAGE" -le 15 ]; then CURRENT_THRESHOLD=15
            elif [ "$PERCENTAGE" -le 20 ]; then CURRENT_THRESHOLD=20
            fi

            if [ "$CURRENT_THRESHOLD" -gt 0 ] && [ "$CURRENT_THRESHOLD" -ne "$LAST_WARNED_THRESHOLD" ]; then
                if [ "$CURRENT_THRESHOLD" -le 10 ]; then
                    hyprctl notify 3 15000 "rgb(ff0000)" "CRITICAL: Battery is at ${PERCENTAGE}%!"
                else
                    hyprctl notify 0 10000 "rgb(df8e1d)" "Battery low: ${PERCENTAGE}% remaining."
                fi
                
                LAST_WARNED_THRESHOLD=$CURRENT_THRESHOLD
            fi
        else
            LAST_WARNED_THRESHOLD=0
        fi
    fi
    
    sleep 30
done
