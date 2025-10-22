#!/bin/bash

set -e

if [ $# -ne 4 ]; then
    echo "Please enter necessary arguments"
    echo "Usage: $0 <db_name> <db_user> <db_pass> <root_pass>"
    exit 1
fi

DB_NAME=$1
DB_USER=$2
DB_PASS=$3
ROOT_PASS=$4

echo "Creating database and user..."
sleep 3

sudo mysql -u root -p"$ROOT_PASS" -e "Create database if not exists \`$DB_NAME\`;"
sudo mysql -u root -p"$ROOT_PASS" -e "Create user if not exists '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
sudo mysql -u root -p"$ROOT_PASS" -e "Grant all privileges on \`$DB_NAME\`.* TO '$DB_USER'@'localhost';"
sudo mysql -u root -p"$ROOT_PASS" -e "Flush Privileges;"


echo "Database '$DB_NAME' and user '$DB_USER' created successfully with full privileges."
