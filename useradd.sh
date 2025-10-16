#!/bin/bash

SINCE=$(date -d '24 hours ago' +%s)
echo "Users in last 24 hours: " > ./temp/new_users_report.txt
awk -F: '$3>=1000 {print $1":"$6}' /etc/passwd | while IFS=: read user home; do
    [ -d "$home" ] && [ $(stat -c %Y "$home") -ge $SINCE ] && echo "$user ($home)" >> ./temp/new_users_report.txt
done
echo "Report saved to new_users_report.txt"
