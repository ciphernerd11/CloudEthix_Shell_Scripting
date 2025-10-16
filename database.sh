#/bin/bash

set -e

read -p "Enter new database name: " db_name
read -p "Enter new MySQL username: " db_user
read -p "Enter new MySQL user password: " db_pass

sudo mysql -u root        -p"$root_pass" -e "CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_pass';"
sudo mysql -u root        -p"$root_pass" -e "GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'localhost';"
sudo mysql -u root        -p"$root_pass" -e "FLUSH PRIVILEGES;"
sudo mysql -u root 	  -p"$root_pass" -e "CREATE DATABASE IF NOT EXISTS \`$db_name\`;"



echo "Database '$db_name' and user '$db_user' created successfully with full privileges."
