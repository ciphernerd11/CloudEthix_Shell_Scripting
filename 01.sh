#Task 01 : Listing the files in a specified directory

#!/bin/bash

read -p "Enter the path to list the content: " S_PATH
CMND="`ls $S_PATH`"
echo "$CMND" > directory.txt
echo "This is directory.txt that is current directory."

