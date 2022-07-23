FROM alpine:3.15.5

RUN apk add --no-cache curl python3 ffmpeg

RUN ln -s /usr/bin/python3 /usr/bin/python

# renovate: datasource=github-tags depName=ytdl-org/youtube-dl
ENV YTDL_VERSION=2021.06.06

RUN curl -L https://github.com/ytdl-org/youtube-dl/releases/download/${YTDL_VERSION}/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENTRYPOINT [ "/usr/local/bin/youtube-dl" ]
