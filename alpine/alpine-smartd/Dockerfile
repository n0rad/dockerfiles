FROM alpine:3.20.1

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
