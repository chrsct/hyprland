#!/usr/bin/env bash

# 1. CPU Usage %
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# 2. RAM Usage
RAM_USED=$(free -h | awk '/Mem:/ {print $3}')
RAM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')

# 3. GPU Usage (Universal Detection)
GPU="N/A"

# Check Nvidia
if command -v nvidia-smi &> /dev/null; then
    GPU_VAL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)
    if [ -n "$GPU_VAL" ]; then GPU="${GPU_VAL}%"; fi

# Check AMD DRM sysfs
elif [ -f /sys/class/drm/card0/device/gpu_busy_percent ]; then
    GPU="$(cat /sys/class/drm/card0/device/gpu_busy_percent)%"
elif [ -f /sys/class/drm/card1/device/gpu_busy_percent ]; then
    GPU="$(cat /sys/class/drm/card1/device/gpu_busy_percent)%"

# Check Intel DRM sysfs frequency load ratio
elif [ -f /sys/class/drm/card0/gt_act_freq_mhz ] && [ -f /sys/class/drm/card0/gt_max_freq_mhz ]; then
    ACT=$(cat /sys/class/drm/card0/gt_act_freq_mhz)
    MAX=$(cat /sys/class/drm/card0/gt_max_freq_mhz)
    if [ "$MAX" -gt 0 ]; then
        GPU="$(( ACT * 100 / MAX ))%"
    fi
fi

# Tooltip JSON output
TOOLTIP="<b>System Resources</b>\n<span color='#888888'>CPU:</span> ${CPU}%\n<span color='#888888'>RAM:</span> ${RAM_USED} / ${RAM_TOTAL}\n<span color='#888888'>GPU:</span> ${GPU}"

printf '{"text": "", "tooltip": "%s"}\n' "$TOOLTIP"
