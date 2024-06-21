FROM alpine:3.18

WORKDIR /

RUN apk update && \
apk add nginx && \
apk add openssl && \
mkdir -p /etc/nginx/ssl

RUN if ! getent group www-data > /dev/null; then addgroup -S www-data; fi
RUN adduser -S www-data -G www-data

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/tool.sh .
RUN	chmod +x tool.sh

EXPOSE 443

ENTRYPOINT ["sh", "tool.sh"]
