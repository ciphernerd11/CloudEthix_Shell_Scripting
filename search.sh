#!/bin/bash

TARGET_DIR=$1
SEARCH_TEXT=$2
REPLACE_TEXT=$3

if [ $# -ne 3 ]; then
    echo "Usage:'/temp/file.txt' 'Ajinkya' 'Anand'"
    exit 1
fi


if [ ! -d "$TARGET_DIR" ]; then
    echo " Error: '$TARGET_DIR' is not a valid directory."
    exit 1
fi

echo " Target Directory: $TARGET_DIR"
echo " Search for : $SEARCH_TEXT"
echo " Replace with : $REPLACE_TEXT"

grep -rl "$SEARCH_TEXT" "$TARGET_DIR" | xargs sed -i "s/$SEARCH_TEXT/$REPLACE_TEXT/g"

STA=$?
if [ $STA -eq 0 ]; then
    echo " Sucessfully replace the word of '$SEARCH_TEXT' with '$REPLACE_TEXT'."
else
    echo "No matches found. Error occured."
fi
