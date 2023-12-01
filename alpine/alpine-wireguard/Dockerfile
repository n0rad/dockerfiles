FROM alpine:3.18.5

RUN apk add --no-cache wireguard-tools iptables ip6tables iproute2 curl iputils speedtest-cli

# wg genkey | tee privatekey | wg pubkey > publickey
