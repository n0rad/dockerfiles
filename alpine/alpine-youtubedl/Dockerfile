FROM alpine

RUN apk add --no-cache curl python3 ffmpeg

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

ENTRYPOINT [ "/usr/local/bin/youtube-dl" ]
