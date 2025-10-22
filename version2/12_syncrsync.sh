#!/bin/bash

# Usage: ./sync_rsync.sh <local_directory> <remote_user>@<remote_host> <remote_directory>

LOCAL_DIR="$1"
REMOTE_USER_HOST="$2"
REMOTE_DIR="$3"

# Validate arguments
if [ -z "$LOCAL_DIR" ] || [ -z "$REMOTE_USER_HOST" ] || [ -z "$REMOTE_DIR" ]; then
    echo "Usage: $0 <local_directory> <remote_user>@<remote_host> <remote_directory>"
    exit 1
fi

# Check if local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Error: Local directory '$LOCAL_DIR' does not exist."
    exit 1
fi

# Sync using rsync over SSH
echo "Syncing '$LOCAL_DIR' → '$REMOTE_USER_HOST:$REMOTE_DIR' ..."
rsync -az --delete -e ssh "$LOCAL_DIR"/ "$REMOTE_USER_HOST:$REMOTE_DIR"

# Check exit status
if [ $? -eq 0 ]; then
    echo "Sync completed successfully at $(date)."
else
    echo "Sync failed at $(date)."
fi

