#!/bin/bash

LOCAL_DIR="$1"
REMOTE_USER_HOST="$2"
REMOTE_DIR="$3"


if [ -z "$LOCAL_DIR" ] || [ -z "$REMOTE_USER_HOST" ] || [ -z "$REMOTE_DIR" ]; then
    echo "Usage: $0 <local_directory> <remote_user>@<remote_host> <remote_directory>"
    exit 1
elif [ ! -d "$LOCAL_DIR" ]; then
    echo "Error: Local directory '$LOCAL_DIR' does not exist."
    exit 1
else
    echo "Syncing '$LOCAL_DIR' → '$REMOTE_USER_HOST:$REMOTE_DIR' ..."
    rsync -az --delete -e ssh "$LOCAL_DIR"/ "$REMOTE_USER_HOST:$REMOTE_DIR"
fi

if [ $? -eq 0 ]; then
    echo "Sync completed successfully at $(date)."
else
    echo "Sync failed at $(date)."
fi

