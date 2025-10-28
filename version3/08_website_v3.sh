#/bin/bash

function SITE_DOWN(){
	echo -e "Hello All, 
   This is system generated email, do not reply to this email.
   
  The website is down $(ifconfig | grep inet | head -n 1 | awk '{print $2}')

   Kindly take necessary action ASAP to avoid future inconvenience.
   
   Server Name : - $(hostname)
   Server IP :- $(ifconfig | grep inet | head -n 1 | awk '{print $2}')
   
   Thank & Regards,
   Team CloudEthix"
}

if [ $# -ne 1 ]; then
	echo "Usage: $0 <website_name>"
	exit 1
elif ! STATUS_CODE=$(curl -Is "$1" 2>/dev/null | head -n 1 | awk '{print $2}') || [ -z "$STATUS_CODE" ]; then
	echo "Failed to fetch $1 - Invalid domain or network issue."
elif [ "$STATUS_CODE" -ne 200 ]; then
	SITE_DOWN
else
	echo "$1 is up"
fi
