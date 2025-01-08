FROM alpine:3.21.2


RUN apk add --no-cache asterisk asterisk-sample-config asterisk-sounds-en asterisk-sounds-moh

RUN mkdir /var/lib/asterisk/sounds/fr &&\
    cd /var/lib/asterisk/sounds/fr &&\
    wget -O core.zip https://www.asterisksounds.org/fr-fr/download/asterisk-sounds-core-fr-FR-sln16.zip &&\
    wget -O extra.zip https://www.asterisksounds.org/fr-fr/download/asterisk-sounds-extra-fr-FR-sln16.zip &&\
    unzip core.zip && rm core.zip &&\
    unzip -o extra.zip && rm extra.zip &&\
    chown -R asterisk:asterisk /var/lib/asterisk/sounds/fr &&\
    find /var/lib/asterisk/sounds/fr -type d -exec chmod 0775 {} \;

# ADD rootfs /
CMD ["usr/sbin/asterisk", "-T", "-W", "-U", "asterisk", "-p", "-vvvdddfB"]
