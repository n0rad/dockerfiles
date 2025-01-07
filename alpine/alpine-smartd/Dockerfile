FROM alpine:3.21.1

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
