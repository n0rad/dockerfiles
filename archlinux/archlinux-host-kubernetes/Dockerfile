from n0rad/archlinux-host

RUN pacman --noconfirm -S \
    bridge-utils \
    inetutils \
    net-tools \
    iotop \
    docker \
    nmon \
    tcpdump \
    dnsutils \
    rsync \
    bc \
    unzip \
    cpio \
    dmidecode \
    traceroute \
    sshfs \
    parted \
    netctl \
    lsof \
    jq \
    intel-ucode \
    mdadm \
    ebtables

RUN sudo -u yaourt yaourt --noconfirm -S kubernetes-bin

ADD rootfs /
