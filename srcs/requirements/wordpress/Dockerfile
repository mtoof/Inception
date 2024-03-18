FROM alpine:3.18

# Check if the www-data group exists, if not, create it
RUN if ! getent group www-data > /dev/null; then addgroup -S www-data; fi

# Create the www-data user and add it to the www-data group
RUN adduser -S www-data -G www-data

# Install PHP & MariaDB client dependencies
RUN apk update && \
    apk add php82 php82-fpm php82-mysqli fcgi php82-phar wget php82-curl php82-xml php82-gd php-mbstring && \
    apk add mariadb-client


# Download and install the WP-CLI tool
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && ln -s /usr/bin/php82 /usr/bin/php

# Download and extract the WordPress package
RUN wget https://wordpress.org/wordpress-6.4.tar.gz -P /var/www/html && \
    cd /var/www/html && \
    tar -xzf /var/www/html/wordpress-6.4.tar.gz && \
    rm /var/www/html/wordpress-6.4.tar.gz

WORKDIR /var/www/html/wordpress

# Copy the tools.sh script from the 'tools' directory to the container
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port for PHP-FPM
EXPOSE 9000

# Set the entrypoint to run the WordPress script
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]