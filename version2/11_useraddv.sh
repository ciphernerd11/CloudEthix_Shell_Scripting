#!/bin/bash

SINCE=$(date -d '24 hours ago' +%s)

REPORT_FILE="./temp/new_users_report.txt"

echo " Users created in the last 24 hours: " > "$REPORT_FILE"
echo "--------------------------------------" >> "$REPORT_FILE"

awk -F: '$3 >= 1000 {print $1":"$6}' /etc/passwd | while IFS=: read user home; do
    if [ -d "$home" ]; then
        LAST_MODIFIED=$(stat -c %Y "$home")
        if [ "$LAST_MODIFIED" -ge "$SINCE" ]; then
            echo " $user (Home: $home)" >> "REPORT_FILE"
        fi
    fi
done

echo "Report generated successfully" >> "$REPORT_FILE"
echo "Report saved to: $REPORT_FILE"
