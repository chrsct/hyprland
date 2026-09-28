#!/bin/bash

# --- Configuration ---
RECORD_DIR="/home/$USER/Videos/records"
LOCK_FILE="/tmp/gpu_recorder.lock"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
OUTPUT_FILE="$RECORD_DIR/$TIMESTAMP.mp4"
LOG_FILE="/tmp/gpu_recorder.log"

mkdir -p "$RECORD_DIR"

if [ -f "$LOCK_FILE" ]; then
    pkill -SIGINT -x wf-recorder
    rm "$LOCK_FILE"
    sync
    
    hyprctl notify 5 3000 "rgb(40a02b)" "Recording Stopped: Video saved!"
    exit 0
fi

touch "$LOCK_FILE"
AUDIO_SOURCE=$(wpctl status 2>/dev/null | grep -A 5 "Video" | grep -m 1 "\[out\]" | awk '{print $3}' | tr -d '.')

if [ -z "$AUDIO_SOURCE" ]; then
    AUDIO_SOURCE=$(pactl get-default-sink 2>/dev/null).monitor
fi

AUDIO_FLAG="--audio=$AUDIO_SOURCE"
if [ -z "$AUDIO_SOURCE" ] || [ "$AUDIO_SOURCE" = ".monitor" ]; then
    AUDIO_FLAG="--audio" 
fi

if lspci | grep -i nvidia >/dev/null && nvidia-smi &>/dev/null; then
    GPU_TYPE="Nvidia (NVENC)"
    REC_CMD="wf-recorder $AUDIO_FLAG -c h264_nvenc -f $OUTPUT_FILE"

elif [ -e /dev/dri/renderD128 ]; then
    GPU_TYPE="AMD/Intel (VAAPI)"
    REC_CMD="wf-recorder $AUDIO_FLAG -c h264_vaapi -d /dev/dri/renderD128 -t -f $OUTPUT_FILE"

else
    GPU_TYPE="CPU (Software)"
    REC_CMD="wf-recorder $AUDIO_FLAG -c libx264 -p preset=ultrafast -f $OUTPUT_FILE"
fi

$REC_CMD > "$LOG_FILE" 2>&1 &

hyprctl notify 1 3000 "rgb(1e66f5)" "Recording Started [$GPU_TYPE]"
