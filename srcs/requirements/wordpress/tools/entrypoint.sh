#!/bin/bash

echo "1"
sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php82/php-fpm.d/www.conf
sed -i 's/;listen.owner = nobody/listen.owner = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/;listen.group = nobody/listen.group = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/user = nobody/user = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/group = nobody/group = www-data/' /etc/php82/php-fpm.d/www.conf

echo "Starting WordPress setup script".

while ! mariadb -h $MARIADB_HOST -u $MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_DATABASE &>/dev/null;
do
    echo "Waiting for the database to be ready";
    sleep 10;
done
echo "ready!"
# wget https://wordpress.org/latest.tar.gz
# tar -xzf latest.tar.gz --strip-components=1
# rm latest.tar.gz

if [ -f wp-config.php ]; then
    echo "WordPress: already installed"
else
	echo "2"
	wp core download --allow-root

	echo "3"
	wp config create --allow-root \
		--dbhost=${MARIADB_HOST} \
		--dbname=${MARIADB_DATABASE} \
		--dbuser=${MARIADB_USER} \
		--dbpass=${MARIADB_PASSWORD}

	echo "4"
	wp core install --allow-root \
		--url=mtoof.42.fr \
		--title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL}

	echo "5"
	wp user create --allow-root \
		${WORDPRESS_USER} ${WORDPRESS_EMAIL} \
		--role=author \
		--user_pass=${WORDPRESS_PASSWORD}
	
	chown -R www-data:www-data /var/www/html
	chmod -R 775 /var/www/html
	echo "wordpress installation completed"
fi

exec php-fpm82 -F -R