#!/bin/bash

TARGET_DIR="./temp"
SEARCH_TEXT="Ajinkya"
REPLACE_TEXT="Anand"

grep -rl "$SEARCH_TEXT" "$TARGET_DIR" | xargs sed -i "s/$SEARCH_TEXT/$REPLACE_TEXT/g"
echo "The file has been modified"
