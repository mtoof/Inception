#!/usr/bin/

openssl req \
       -newkey rsa:2048 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key \
       -x509 -days 365 -out $CERTS_ \
	   -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Hive Helsinki/CN=mtoof.42.fr"
