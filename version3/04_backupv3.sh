#!/bin/bash


if [ $# -ne 3 ]; then
    echo "Usage: $0 <source_directory> <remote_user>@<remote_host> <remote_backup_directory>"
    exit 1
fi

SOURCE_DIR="$1"
REMOTE_USER_HOST="$2"
REMOTE_DIR="$3"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
elif
    echo "Starting backup of '$SOURCE_DIR' to '$REMOTE_USER_HOST:$REMOTE_DIR'..."
    rsync -avz -e ssh "$SOURCE_DIR" "$REMOTE_USER_HOST:$REMOTE_DIR"

elif [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
fi

