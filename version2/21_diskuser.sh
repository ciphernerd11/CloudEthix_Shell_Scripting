#!/bin/bash

# Check if username is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USER="$1"

echo "Calculating disk usage for user: $USER"
echo "-------------------------------------"

# Find all files owned by the user and calculate total size
du -ch $(find /home /var / -user "$USER" 2>/dev/null) | grep total

