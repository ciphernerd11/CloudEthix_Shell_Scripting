#/bin/bash
urls=("https://www.google.com" "https://www.openai.com")
read -p "Enter the name of the website: " SITE
STATUS_CODE="$(curl -Is $SITE | head -n 1 | awk '{print $2}')"
if ((STATUS_CODE != 200)); then
	echo "$SITE is down"
else
	echo "$SITE is up"
fi
