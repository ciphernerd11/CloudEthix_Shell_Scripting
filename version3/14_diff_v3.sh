#!/bin/bash

DIR1=$1
DIR2=$2

if [ $# -ne 2 ]; then
    echo "Usage: $0 ./diff1  ./diff2"
    exit 1
elif [ ! -d "$DIR1" ]; then
    echo "Error: '$DIR1' is not a valid directory."
    exit 1
elif [ ! -d "$DIR2" ]; then
    echo "Error: '$dir2' is not a valid directory."
    exit 1
else
    echo "Comparing directories..."
    echo "Directory 1: $DIR1"
    echo "Directory 2: $DIR2"

    diff -rq "$DIR1" "$DIR2"
    status=$?
fi

if [ $status -eq 0 ]; then
    echo "No differences found. The directories are identical."
elif [ $status -eq 1 ]; then
    echo " Differences found between the directories. Please check it."
else
    echo "An error occured during comparison."
fi
