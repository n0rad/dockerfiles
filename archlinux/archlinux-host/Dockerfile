FROM archlinux:base

# reflector
RUN pacman --noconfirm -Syu \
    reflector && \
    reflector --country France --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# aur support
RUN pacman --noconfirm -Syu \
    wget \
    base-devel \
    git

# yay
RUN cd /tmp && \
    wget https://github.com/Jguer/yay/releases/download/v9.4.4/yay_9.4.4_x86_64.tar.gz && \
    tar xvzf yay_9.4.4_x86_64.tar.gz && \
    cp yay_9.4.4_x86_64/yay /usr/bin && \
    cd / && rm -Rf /tmp/* && \
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd && \
    echo "yay:x:20002:" >> /etc/group  && \
    echo "yay:x:20002::::::" >> /etc/shadow && \
    echo $'Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay \n\
    %yay ALL=(ALL) NOPASSWD: PACMAN' > /etc/sudoers.d/yay && \
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf && \
    mkdir /var/lib/yay && chown yay: /var/lib/yay && \
    passwd -l root

# packages
RUN su -c $"yay -Sy --noconfirm \
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
    tree \
    nmon \
    iotop \
    \
    vim \
    \
    ethtool \
    socat \
    iputils \
    pciutils \
    net-tools \
    bind-tools \
    conntrack-tools \
    iproute2 \
    " yay

ADD rootfs /

# some cleanup
RUN rm -Rf /var/log
