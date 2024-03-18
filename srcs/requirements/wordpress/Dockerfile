FROM alpine:3.18

RUN apk update && apk add openrc && \
apk add php82 php82-fpm php-mysqli curl mariadb-client wget php82-pear php82-phar php82-json php82-mbstring php82-openssl

RUN if ! getent group www-data > /dev/bull; then addgroup -S www-data; fi
RUN adduser -S www-data -G www-data
#Install wp core
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && ln -s /usr/bin/php82 /usr/bin/php


COPY ./tools/entrypoint.sh /
# COPY ./conf/wp-config.php /
RUN chmod +x entrypoint.sh

EXPOSE 9000

entrypoint ["sh", "entrypoint.sh"]