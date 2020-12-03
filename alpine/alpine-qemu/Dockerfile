FROM alpine

RUN apk add --no-cache qemu-system-x86_64 tini

ENTRYPOINT ["/tini", "-v", "--"]
