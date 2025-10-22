#!/bin/bash

LOG_FILE="/var/log/secure"
OUTPUT_FILE="failed_logs.txt"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

echo "Extracting failed ssh login attempts..."
grep "Failed password" "$LOG_FILE" | tee "$OUTPUT_FILE"

echo "Report saved to '$OUTPUT_FILE'"
