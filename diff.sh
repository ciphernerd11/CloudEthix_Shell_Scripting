read -p "Enter the path to directory 1 : " dir1
read -p "Enter the path to directory 2 : " dir2

diff -rq "$dir1" "$dir2"

if [ "$?" -eq 0 ]; then
    echo "No differences found. Directories are identical."
elif [ "$?" -eq 1 ]; then
    echo "Differences found between the directories."
else
    echo "Unidentified error occured check the system again."
fi
