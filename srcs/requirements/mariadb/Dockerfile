FROM alpine:3.18

RUN apk update && apk add mariadb mariadb-client openrc

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN chmod 440 /etc/my.cnf.d/mariadb-server.cnf

COPY ./tools/entrypoint.sh /
RUN chmod +x entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["sh", "entrypoint.sh"]