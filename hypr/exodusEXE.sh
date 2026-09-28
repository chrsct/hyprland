#!/usr/bin/env bash

if pgrep -x "exodus" > /dev/null; then
    pkill -x "exodus"
else
    ~/.config/hypr/exodus
fi