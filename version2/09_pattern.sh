#!/bin/bash


DIR="$1"
PATTERN="$2"

if [ -z "$DIR" ] || [ -z "$PATTERN" ]; then
    echo "Usage: $0 <directory><pattern>"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

echo "Searching for files matching '$PATTERN' in '$DIR'..."
MATCHES=$(find "$DIR" -type f -name "$PATTERN")

if [ -z "$MATCHES" ]; then
    echo "No files found matching pattern '$PATTERN'."
else
    echo "Deleting the following files: "
    echo "$MATCHES"
    find "$DIR" -type f -name "$PATTERNN" -delete
    echo "Deletion completed."
fi 

