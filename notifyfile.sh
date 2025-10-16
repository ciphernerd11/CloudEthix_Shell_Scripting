#/bin/bash

read -p "Enter the full path of the file to monitor: " FILE

if [[ ! -f "$FILE" ]]; then
    echo "ERROR: File '$FILE' does not exist."
    exit 1
fi

ACTION(){
    echo "File '$FILE' has been modified at $(date)."
}

echo "Monitoring changes in '$FILE'..."

while inotifywait -e -m "$FILE" > /dev/null 2>&1; do
    ACTION
done
