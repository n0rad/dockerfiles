FROM alpine:3.19.1 AS builder

RUN apk add go git unbound-dev make && rm -rf /var/cache/apk/*
RUN git clone https://github.com/coredns/coredns.git && \
    cd coredns && \
    echo -n 'unbound:github.com/coredns/unbound' >> plugin.cfg && \
    make CGO_ENABLED=1


FROM alpine:3.19.1
RUN apk add ca-certificates unbound-libs && rm -rf /var/cache/apk/*
COPY --from=builder /coredns/coredns /coredns
EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]

LABEL platform="linux/amd64"