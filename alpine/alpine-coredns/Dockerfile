FROM alpine:3.17.3

RUN apk add --no-cache coredns upx &&\
    upx --best /usr/bin/coredns &&\
    apk del --no-cache upx &&\
    rm -rf /var/cache/apk/*
