SERVICE="nginx"
if pgrep -x "$SERVICE" > /dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE is restarting"
    CMND="`systemctl restart $SERVICE`"
    echo "$SERVICE is restarted"
fi
