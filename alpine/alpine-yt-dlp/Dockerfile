FROM alpine:3.18.5

RUN apk add --no-cache curl python3 ffmpeg

# renovate: datasource=github-tags depName=ytdl-org/youtube-dl
ENV YTDL_VERSION=2021.06.06

RUN curl -L https://github.com/ytdl-org/youtube-dl/releases/download/${YTDL_VERSION}/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENTRYPOINT [ "/usr/local/bin/youtube-dl" ]
