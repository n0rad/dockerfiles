FROM alpine:3.15.5

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
