#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER="$1"

USER_HOME=$(eval echo "~$USER" )

if [ ! -d "$USER_HOME" ]; then
    echo "User '$USER' not found or home directory missing."
    exit 1
fi

echo "Calculating disk space used by user: $USER"
du -sh "$USER_HOME" 2>/dev/null | awk '{print "Total disk usage: " $1}'
