FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client openrc

COPY ./conf/50-server.cnf /etc/my.cnf.d/50-server.cnf
RUN chmod 644 /etc/my.cnf.d/50-server.cnf

COPY ./tools/init_db.sh /
RUN chmod +x init_db.sh

EXPOSE 3306

CMD ["sh", "init_db.sh"]