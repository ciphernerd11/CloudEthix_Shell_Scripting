#!/bin/bash

FILE="/home/anand/shell_tasks/Scripts/modified.txt"
MARKER="/temp/marker.file"
ACTION_FILE="/home/anand/shell_tasks/Scripts/modcheck.txt"

[ ! -f "$MARKER" ] && touch -r "$FILE" "$MARKER"

POLLING_INTERVAL=5

while true; do
    sleep "$POLLING_INTERVAL"
    
    if find "$FILE" -newer "$MARKER" >/dev/null 2>&1; then
        echo "$FILE modified at $(date)" > "$ACTION_FILE"
        touch -r "$FILE" "$MARKER"   
    fi
done 
