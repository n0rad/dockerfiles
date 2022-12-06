FROM golang:1.19.4 as builder

RUN echo "deb http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list

# gcc for cgo
RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
		gcc-aarch64-linux-gnu \
		libc6-dev-arm64-cross \
		libblkid-dev \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/coreos/ignition.git /go/src/github.com/coreos/ignition

# renovate: datasource=github-tags depName=coreos/ignition
ARG IGNITION_VERSION=v2.14.0
RUN cd /go/src/github.com/coreos/ignition && \
    git checkout ${IGNITION_VERSION} && \
    ./build

## 

FROM debian:stable-20221205
COPY --from=builder /go/src/github.com/coreos/ignition/bin/amd64/ignition /usr/bin
ENTRYPOINT [ "/usr/bin/ignition" ]
