#/bin/bash

LOG_FILE="/var/log/secure"
OUTPUT_FILE="failed_logs.txt"

if [ -f "$LOG_FILE" ]; then
    echo "Failed SSH login attempts: "
    echo "Report is stored to" "$OUTPUT_FILE"
    grep "Failed password" "$LOG_FILE" 
else
    echo "Log file not found: $LOG_FILE"
fi
