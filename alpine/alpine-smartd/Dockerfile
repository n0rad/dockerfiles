FROM alpine:3.20.3

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
