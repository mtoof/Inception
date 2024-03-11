FROM alpine:3.18

RUN apk update && \
apk add nginx && \
apk add openssl

COPY ./tools/tool.sh .

CMD [ "tool.sh" ]