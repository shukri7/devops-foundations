#!/bin/bash
set -euo pipefail

# 1. Install WordPress dependencies
apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apache2 mariadb-server php libapache2-mod-php \
  php-mysql php-curl php-gd php-xml php-mbstring \
  php-zip curl openssl

systemctl enable --now apache2 mariadb

# 2. Create and safely store a database password
PASSWORD_FILE="/root/.wordpress-db-password"

if [ ! -f "$PASSWORD_FILE" ]; then
  umask 077
  openssl rand -hex 24 > "$PASSWORD_FILE"
fi

DB_PASS=$(cat "$PASSWORD_FILE")

# 3. Configure the WordPress database
mariadb <<SQL
CREATE DATABASE IF NOT EXISTS wordpress
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'wpuser'@'localhost'
  IDENTIFIED BY '${DB_PASS}';

ALTER USER 'wpuser'@'localhost'
  IDENTIFIED BY '${DB_PASS}';

GRANT ALL PRIVILEGES ON wordpress.*
  TO 'wpuser'@'localhost';
SQL

# 4. Download WordPress only if not installed
if [ ! -f /var/www/html/wp-settings.php ]; then
  curl -fsSL https://wordpress.org/latest.tar.gz \
    | tar -xz --strip-components=1 -C /var/www/html
fi

rm -f /var/www/html/index.html

# 5. Configure WordPress only if not configured
cd /var/www/html

if [ ! -f wp-config.php ]; then
  cp wp-config-sample.php wp-config.php

  sed -i "s/database_name_here/wordpress/" wp-config.php
  sed -i "s/username_here/wpuser/" wp-config.php
  sed -i "s/password_here/${DB_PASS}/" wp-config.php

  # Generate unique WordPress security keys
  for KEY in AUTH_KEY SECURE_AUTH_KEY LOGGED_IN_KEY \
    NONCE_KEY AUTH_SALT SECURE_AUTH_SALT \
    LOGGED_IN_SALT NONCE_SALT
  do
    SALT=$(openssl rand -hex 48)
    sed -i "/define( '$KEY'/s/put your unique phrase here/$SALT/" \
      wp-config.php
  done
fi

# 6. Set permissions and restart Apache
chown -R www-data:www-data /var/www/html
chmod 640 /var/www/html/wp-config.php

systemctl restart apache2

echo "WordPress server setup completed successfully."
