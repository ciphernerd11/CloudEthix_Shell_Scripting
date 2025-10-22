#!/bin/bash

if  [ EUID -ne 0 ]; then
    echo " Plesae run this script as root."
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain_name>"
    exit 1
fi

DOMAIN=$1
DIR="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf" 

mkdir -p "$DIR"
echo " $DOMAIN is live" > "$DIR/index.html"

cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
    <Directory $DIR>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF

apachectl configtest
if [ $? -ne 0 ]; then   
    echo " Apache configuration error please check $CONF"
    exit 1
fi

systemctl reload httpd
echo "Virtual host for '$DOMAIN' created and Apache reloaded successfully."
echo "DocumentRoot: $DIR"
echo "Config file: $CONF"
