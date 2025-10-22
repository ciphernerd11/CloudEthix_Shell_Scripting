#!/bin/bash

# Usage: ./create_vhost.sh <domain_name>

DOMAIN="$1"
DOC_ROOT="/var/www/$DOMAIN"
CONF_FILE="/etc/apache2/sites-available/$DOMAIN.conf"

# Check if domain is provided
if [ -z "$DOMAIN" ]; then
    echo "Usage: $0 <domain_name>"
    exit 1
fi

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)."
    exit 1
fi

# Create document root
mkdir -p "$DOC_ROOT"
echo "<h1>Welcome to $DOMAIN</h1>" > "$DOC_ROOT/index.html"

# Set permissions
chown -R www-data:www-data "$DOC_ROOT"
chmod -R 755 "$DOC_ROOT"

# Create virtual host configuration
cat > "$CONF_FILE" <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@$DOMAIN
    ServerName $DOMAIN
    ServerAlias www.$DOMAIN
    DocumentRoot $DOC_ROOT
    ErrorLog \${APACHE_LOG_DIR}/$DOMAIN-error.log
    CustomLog \${APACHE_LOG_DIR}/$DOMAIN-access.log combined
</VirtualHost>
EOF

# Enable the site and reload Apache
a2ensite "$DOMAIN.conf" > /dev/null
systemctl reload apache2

echo "Virtual host created and enabled for: $DOMAIN"
echo "Document root: $DOC_ROOT"
echo "Config file: $CONF_FILE"

