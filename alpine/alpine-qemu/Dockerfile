FROM alpine:3.18.0

RUN apk add --no-cache qemu-system-$(uname -m) ovmf tini

ENTRYPOINT ["/sbin/tini", "-v", "--"]
