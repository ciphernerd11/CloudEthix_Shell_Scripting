#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

SERVICE="$1"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running."
else
    echo "$SERVICE is not running. Restarting..."
    systemctl restart "$SERVICE"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE restarted successfully."
    else
        echo "Failed to restart $SERVICE."
    fi
fi
