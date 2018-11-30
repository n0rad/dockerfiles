from n0rad/archlinux-host

RUN pacman --noconfirm -S \
    bridge-utils \
    inetutils \
    iotop \
    docker \
    nmon \
    tcpdump \
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
    mdadm

RUN sudo -u yaourt yaourt --noconfirm -S kubelet-bin

RUN systemctl enable \
    kubelet.service
