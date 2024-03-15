FROM alpine:3.18

RUN apk update && apk add mariadb openrc && \
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

COPY ./tools/init_db.sh /
RUN chmod +x /init_db.sh

EXPOSE 3306

CMD ["/init_db.sh"]
