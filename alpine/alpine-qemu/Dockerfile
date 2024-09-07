FROM alpine:3.20.3

RUN apk add --no-cache qemu-system-$(uname -m) $([ "$(uname -m)" == "x86_64" ] && echo "ovmf") tini

ENTRYPOINT ["/sbin/tini", "-v", "--"]
