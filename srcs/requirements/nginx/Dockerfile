FROM alpine:3.18

WORKDIR /

RUN apk update && \
apk add nginx && \
apk add openssl && \
mkdir -p /run/nginx/ssl && \
rm -rf /etc/nginx/nginx.conf


COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/tool.sh .
RUN	chmod +x tool.sh
EXPOSE 443

ENTRYPOINT ["sh", "tool.sh"]