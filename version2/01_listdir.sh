#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIR="$1"
OUTPUT="file_list.txt"

if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

ls -lh "$DIR" > "$OUTPUT"
echo "File list from '$DIR' saved to $OUTPUT"
