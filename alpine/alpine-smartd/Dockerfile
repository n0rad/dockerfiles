FROM alpine:3.18.2

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
