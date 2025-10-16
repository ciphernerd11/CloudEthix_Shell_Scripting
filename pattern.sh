#!/bin/bash

read -p "Enter the directory path :" dir_path
read -p "Enter the pattern: " pattern
find "$dir_path" -type f -name "$pattern" -delete 
echo "Deletion process completed."
