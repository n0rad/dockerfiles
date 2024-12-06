FROM alpine:3.21.0

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
