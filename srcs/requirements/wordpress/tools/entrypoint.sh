#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

sed -i 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:9000/' /etc/php82/php-fpm.d/www.conf

# wget https://wordpress.org/latest.tar.gz
# tar -xzf latest.tar.gz --strip-components=1
# rm latest.tar.gz

wp core download --allow-root

wp config create --allow-root \
	--dbhost=${MARIADB_HOST} \
	--dbname=${MARIADB_DATABASE} \
	--dbuser=${MARIADB_USER} \
	--dbpass=${MARIADB_PASSWORD}

wp core install --allow-root \
	--url=${DOMAIN_NAME} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL}

wp user create --allow-root \
	${WORDPRESS_USER} ${WORDPRESS_EMAIL} \
	--role=${WP_ROLE} \
	--user_pass=${WORDPRESS_PASSWORD}

chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

php-fpm82 -F