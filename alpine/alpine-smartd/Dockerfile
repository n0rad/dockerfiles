FROM alpine:3.20.2

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
