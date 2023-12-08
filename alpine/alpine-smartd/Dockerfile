FROM alpine:3.19.0

RUN apk add --no-cache smartmontools mailx msmtp
CMD ["smartd", "-n", "-d"]
