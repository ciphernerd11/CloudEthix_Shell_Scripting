#!/bin/bash

DIRECTORY=$1
DAYS=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_name>"
    exit 1
elif [ ! -d "$DIRECTORY" ]; then
    echo "Error: '$DIRECTORY' is not a valid directory."
    exit 1
elif ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Error: '$DAYS' is not a valid number."
    exit 1
else
    echo "Listing files in '$DIRECTORY' not accessed in the last $DAYS days."
    find "$DIRECTORY" -type f -atime +"$DAYS" -print
fi
    echo "Task Completed"
