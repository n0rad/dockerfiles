FROM alpine:3.16.2

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
