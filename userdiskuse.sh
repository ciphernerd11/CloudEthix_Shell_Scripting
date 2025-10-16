#!/bin/bash

read -p "Enter the username: " username


if id "$username" &>/dev/null; then
    total_size=$(find / -user "$username" -type f -exec du -ch {} + 2>/dev/null | grep total$ | awk '{print $1}')

    echo "Total disk space used by user '$username': $total_size"
else
    echo "User '$username' does not exist."
    exit 1
fi
