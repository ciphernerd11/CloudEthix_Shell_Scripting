#!/bin/bash

CITY=$1

if [ -z "$1" ]; then
    echo "Usage: $0 <City_Name>"
    exit 1
else
    curl "https://wttr.in/${CITY}?format=3"
fi
