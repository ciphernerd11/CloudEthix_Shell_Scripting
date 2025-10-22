#/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <website_name>"
	exit 1
fi

SITE=$1

STATUS_CODE="$(curl -Is $SITE | head -n 1 | awk '{print $2}')"
if ((STATUS_CODE != 200)); then
	echo "$SITE is down"
else
	echo "$SITE is up"
fi
