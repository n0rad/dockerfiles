FROM alpine:3.16.3

RUN apk add --no-cache qemu-system-x86_64 ovmf tini

ENTRYPOINT ["/sbin/tini", "-v", "--"]
