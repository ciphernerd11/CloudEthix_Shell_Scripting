#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <log_file> [output_file]"
    exit 1
fi

LOG_FILE="$1"
OUTPUT_FILE="${2:-/tmp/system_log_summary.txt}"

{
    echo "System Log Summary - $(date)"
    echo "Top 10 Most Frequent Log messages:"
    awk '{print $5}' "LOG_FILE" | sort | uniq -c | sort -nr | head -10

    echo "Failed SSH Login attempts: "
    grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr

    echo "Recent Warnings and Errors: "
    grep -Ei "warning|error|failed|critical" "$LOG_FILE" | tail -20
} > "$OUTPUT_FILE"

cat "$OUTPUT_FILE"
echo "Summary saved to: $OUTPUT_FILE"
