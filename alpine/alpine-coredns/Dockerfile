FROM alpine:3.20.3

RUN apk add --no-cache coredns upx &&\
    upx --best /usr/bin/coredns &&\
    apk del --no-cache upx &&\
    rm -rf /var/cache/apk/*

CMD [ "coredns", "-conf", "/etc/coredns/Corefile" ]

ADD rootfs /
