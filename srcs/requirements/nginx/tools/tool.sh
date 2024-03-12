#!/bin/sh

openssl req \
       -newkey rsa:2048 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key \
       -x509 -days 365 -out /etc/ssl/private/nginx-selfsigned.crt \
	   -subj "/C=FI/ST=Uusimaa/L=Helsinki/O=Hive Helsinki/CN=mtoof.42.fr"

nginx -g "daemon off;"