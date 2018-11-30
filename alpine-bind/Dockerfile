FROM alpine

RUN apk add bind

CMD named -4 /etc/bind/named.conf -u bind -f
