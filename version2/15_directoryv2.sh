#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 /etc 2"
    exit 1
fi

DIRECTORY=$1
DAYS=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: '$DIRECTORY' is not a valid directory."
    exit 1
fi

if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Error: '$DAYS' is not a valid number."
    exit 1
fi

echo "Listing files in '$DIRECTORY' not accessed in the last $DAYS days."

find "$DIRECTORY" -type f -atime +"$DAYS" -print

echo "Task Completed"
