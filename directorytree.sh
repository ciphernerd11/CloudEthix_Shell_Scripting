#!/bin/bash

read -p "Enter name of the directory to list: " DIRECTORY
read -p "Enter number of days: " DAYS

find "$DIRECTORY" -type f -atime +"$DAYS" -print
