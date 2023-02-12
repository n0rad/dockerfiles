FROM alpine:3.17.2

RUN apk add --no-cache qemu-system-x86_64 ovmf tini

ENTRYPOINT ["/sbin/tini", "-v", "--"]
