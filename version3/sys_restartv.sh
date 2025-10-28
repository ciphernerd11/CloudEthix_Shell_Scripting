#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 nginx"
    exit 1
fi

SERVICE=$1

if pgrep -x "SERVICE" > /dev/null; then
    echo "$SERVICE is running."
else
    echo "$SERVICE is not running - attempting to restart..."
    sleep 3
    systemctl restart "$SERVICE"

    if pgrep -x "$SERVICE" > /dev/null; then
        echo " $SERVICE has been successfully restarted."
    else
        echo "Failed to restart $SERVICE. Please chekc the logs."
    fi
fi
