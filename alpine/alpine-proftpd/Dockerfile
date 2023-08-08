FROM alpine:3.18.3

RUN apk add --no-cache proftpd shadow &&\
    mkdir -p /var/run/proftpd/

CMD ["proftpd", "-n"]
