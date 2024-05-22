FROM alpine:3.20.0

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
