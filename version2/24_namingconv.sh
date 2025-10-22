#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 /dir1 file1 AnandFile"
    exit 1
fi

DIR_NAME=$1
OLD_FILE_NAME=$2
NEW_FILE_NAME=$3

if [ ! -d "$DIR_NAME" ]; then
    echo " Error: '$DIR_NAME' is not valid directory."
    exit 1
fi

echo "Renaming files in '$DIR_NAME'..."
sleep 3
echo "Replacing '$OLD_FILE_NAME' with '$NEW_FILE_NAME'"

find "$DIR_NAME" -maxdepth 1 -type f | while IFS= read -r file; do
    new_name=$(echo "$file" | sed "s/$OLD_FILE_NAME/$NEW_FILE_NAME/g")
    if [ "$file" != "$new_name" ]; then
        echo " Renaming: '$file' -> '$new_name'"
        mv "$file" "$new_name"
    fi
done

sleep 3
echo "File remaining completed."
