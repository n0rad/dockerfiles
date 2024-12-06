FROM alpine:3.21.0

RUN apk add --no-cache proftpd shadow &&\
    mkdir -p /var/run/proftpd/

CMD ["proftpd", "-n"]
