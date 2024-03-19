#!/bin/bash

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php82/php-fpm.d/www.conf
sed -i 's/;listen.owner = nobody/listen.owner = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/;listen.group = nobody/listen.group = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/user = nobody/user = www-data/' /etc/php82/php-fpm.d/www.conf
sed -i 's/group = nobody/group = www-data/' /etc/php82/php-fpm.d/www.conf

echo "Starting WordPress setup script".

while ! mariadb -h $MARIADB_HOST -u $MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_DATABASE &>/dev/null;
do
    echo "Waiting for the database to be ready";
    sleep 5;
done
echo "ready!"

if [ -f wp-config.php ]; then
    echo "WordPress: already installed"
else
	wp core download --allow-root

	wp config create --allow-root \
		--dbhost=${MARIADB_HOST} \
		--dbname=${MARIADB_DATABASE} \
		--dbuser=${MARIADB_USER} \
		--dbpass=${MARIADB_PASSWORD}

	wp core install \
			--url=https://${DOMAIN_NAME} \
			--title=${WORDPRESS_TITLE} \
			--admin_user=${WORDPRESS_ADMIN_USER} \
			--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
			--admin_email=${WORDPRESS_ADMIN_EMAIL} \
			--path=/var/www/html/wordpress/ \
			--allow-root;

    # Create an additional user with the role of author
    wp user create \
        ${WORDPRESS_USER} \
        ${WORDPRESS_EMAIL} \
        --role=author \
        --user_pass=${WORDPRESS_PASSWORD} \
        --allow-root \
        --path=/var/www/html/wordpress;
	
	wp cache flush \
        --allow-root;

    # Install a WordPress theme
    wp theme install \
        inspiro \
        --activate \
        --allow-root;

    # Update the WordPress site URL option
    wp option update siteurl "https://${DOMAIN_NAME}" \
        --allow-root;

    # Update the WordPress home option
    wp option update home "https://${DOMAIN_NAME}" \
        --allow-root;

	chown -R www-data:www-data /var/www/html
	chmod -R 775 /var/www/html
	echo "wordpress installation completed"
fi
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

exec php-fpm82 -F -R