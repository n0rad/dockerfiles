FROM archlinux/base

RUN pacman --noconfirm -Syu \
    efibootmgr \
    syslinux \
    \
    linux \
    intel-ucode \
    \
    gptfdisk \
    hdparm \
    smartmontools \
    xfsprogs \
    mdadm \
    \
    systemd-sysvcompat \
    openssh \
    haveged \
    \
    grep \
    sudo \
    curl \
    wget \
    \
    htop \
    iftop \
    dfc \
    psmisc \
    ncdu \
    nmon \
    iotop \
    \
    vim \
    \
    ebtables \
    ethtool \
    socat \
    iputils \
    net-tools \
    bind-tools \
    conntrack-tools \
    iproute2

# ADD rootfs /

# do not allow empty root login
RUN passwd -l root

# some cleanup
RUN rm -Rf /var/log
