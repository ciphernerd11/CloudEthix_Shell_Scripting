#!/bin/bash

TARGET_DIR="${1:-.}"

if [ ! -d "TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

echo "Organizing files in: $TARGET_DIR"

mkdir -p "$TARGET_DIR"/{Images, Documents, Audio, Video, Archives, Others}

for FILE in "$TARGET_DIR"/*; do
    [ -f "$FILE" ] || continue

    case "${FILE,,}" in 
        *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.svg|*.webp) 
            mv "$FILE" "$TARGET_DIR/Images/" ;;
        *.pdf|*.doc|*.docx|*.txt|*.xls|*.xlsx|*.ppt|*.pptx|*.odt)
            mv "$FILE" "$TARGET_DIR/Documents/" ;;
        *.mp3|*.wav|*.ogg|*.flac|*.m4a)
            mv "$FILE" "$TARGET_DIR/Audio/" ;;
        *.mp4|*.mkv|*.avi|*.mov|*.wmv|*.flv)
            mv "$FILE" "$TARGET_DIR/Video/" ;;
        *.zip|*.tar|*.gz|*.bz2|*.rar|*.7z)
            mv "$FILE" "$TARGET_DIR/Archives/" ;;
        *)
            mv "$FILE" "$TARGET_DIR/Others/" ;;
    esac
done

echo "Organization completed successfully."
