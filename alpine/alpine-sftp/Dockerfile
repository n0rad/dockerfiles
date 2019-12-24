FROM alpine

RUN apk add --no-cache openssh openssh-sftp-server

COPY sshd_config /etc/ssh/sshd_config

CMD [ "/usr/sbin/sshd", "-D", "-e" ]
