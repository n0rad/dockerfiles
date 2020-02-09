FROM ubuntu:xenial

# pht
RUN apt-get update && \
    apt-get install -y libcec3 libmad0 && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:plexapp/plexht -y && \
    add-apt-repository ppa:pulse-eight/libcec -y && \
    apt-get update && \
    apt-get install plexhometheater -y && \
    cd /usr/lib/x86_64-linux-gnu && \
    ln -s libp8-platform.so.2 libp8-platform.so.2.0

# Set up the user
ENV UNAME plex
RUN export UNAME=$UNAME UID=1000 GID=1000 && \
    mkdir -p "/home/${UNAME}" && \
    echo "${UNAME}:x:${UID}:${GID}:${UNAME} User,,,:/home/${UNAME}:/bin/bash" >> /etc/passwd && \
    echo "${UNAME}:x:${UID}:" >> /etc/group && \
    mkdir -p /etc/sudoers.d && \
    echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
    chmod 0440 /etc/sudoers.d/${UNAME} && \
    chown ${UID}:${GID} -R /home/${UNAME} && \
    gpasswd -a ${UNAME} audio

COPY pulse-client.conf /etc/pulse/client.conf

ENV HOME=/home/$UNAME
ENV DISPLAY=:0.0
ENV PULSE_SERVER=unix:/run/user/1000/pulse/native

RUN apt-get install -y libopus0 x265 x264 libvdpau1 libvdpau-va-gl1
    # cd /usr/lib/x86_64-linux-gnu && ln -s libcec.so.3 libcec.so.3.0.1


# USER $UNAME
CMD su -c plexhometheater.sh plex

# xhost +
# chmod 755 /run/user/$(id -u)/pulse
# docker run --privileged -it -v $PWD/home:/home/plex --net host --rm -v /tmp/.X11-unix:/tmp/.X11-unix --volume=/run/user/$(id -u)/pulse:/run/user/1000/pulse  -v /lib/modules/$(uname -r):/lib/modules/$(uname -r)
