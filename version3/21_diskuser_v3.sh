#!/bin/bash


USER="$1"
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
else
  echo "Calculating disk usage for user: $USER"
  echo "-------------------------------------"
  du -ch $(find /home /var / -user "$USER" 2>/dev/null) | grep total
fi
