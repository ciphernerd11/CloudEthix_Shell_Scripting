#!/bin/bash

check_disk_space() {
	disk_space=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

	threshold=25

	if [ "$disk_space" -ge "$threshold" ]; then
		return 1
	else
		return 0
	fi
}
send_email() {
	sender="bhavikanand21@gmail.co"
	receiver="bhavikanand21@gmail.com"
	gapp=
	sub="Disk Space Alert"
	body="Disk space is critically low. Please take necessary action."
	
	response=$(curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
	--mail-from "$sender" \
	--mail-rcpt "$receiver" \
	--user "$sender:$gapp" \
	-T <(echo -e "From: $sender\nTo: $receiver\nSubject: $sub\n\n$body"))

	if [ $? -eq 0 ]; then
		echo "Email sent sucessfully."
	else
		echo "Failed to send email."
		echo "Response: $reponse"
	fi
}
check_disk_space
if [ $? -eq 1 ]; then
    send_email
fi
