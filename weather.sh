#!/bin/bash


if [ -z "$1" ]; then
    echo "Usage: $0 <City_Name>"
    exit 1
fi

CITY="$1"


curl "https://wttr.in/${CITY}?format=3"
