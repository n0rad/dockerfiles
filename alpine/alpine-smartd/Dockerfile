FROM alpine:3.16.3

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
