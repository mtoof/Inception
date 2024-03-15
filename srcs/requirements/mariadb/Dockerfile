FROM alpine:3.18

RUN apk update && apk add mariadb openrc

COPY ./conf/50-server.cnf /etc/my.cnf.d/

COPY ./tools/init_db.sh /

EXPOSE 3306

CMD ["/init_db.sh"]