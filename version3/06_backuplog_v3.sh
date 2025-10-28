#!/bin/bash

LOG_DIR="$1"
DAYS="$2"
ARCHIVE_DIR="$3"


if [ -z "$LOG_DIR" ] || [ -z "$DAYS" ] || [ -z "$ARCHIVE_DIR" ]; then
    echo "Usage: $0 <log_directory> <days_old> <archive_directory>"
    exit 1
elif [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory '$LOG_DIR' does not exist."
    exit 1
else
    mkdir -p "$ARCHIVE_DIR"
fi

find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -print0 | while IFS= read -r -d '' FILE; do
    BASENAME=$(basename "$FILE")
    TAR_FILE="$ARCHIVE_DIR/${BASENAME}_$(date +%Y%m%d).tar.gz"
    tar -czf "$TAR_FILE" -C "$(dirname "$FILE")" "$BASENAME" && rm -f "$FILE"
    echo "Archived $FILE to $TAR_FILE"
done

echo "Log archiving completed."
