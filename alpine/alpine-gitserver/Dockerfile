FROM alpine:3.21.2

RUN apk add --no-cache openssh git

RUN adduser -h /home/git -s /usr/bin/git-shell -u 619 -D git && \
    mkdir -p /home/git/.ssh && chmod 700 /home/git/.ssh && \
    touch /home/git/.ssh/authorized_keys && chmod 600 /home/git/.ssh/authorized_keys && \
    chown -R git: /home/git/.ssh && \
    passwd -u git
    

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes"  >> /etc/ssh/sshd_config 

EXPOSE 22
CMD [ -f ssh_host_ecdsa_key ] || ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521; \
    exec /usr/sbin/sshd -De
