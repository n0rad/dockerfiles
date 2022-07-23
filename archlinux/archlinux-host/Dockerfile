FROM archlinux:base-20220710.0.67642

# renovate: datasource=github-tags depName=Jguer/yay
ENV YAY_VERSION=v11.2.0

RUN \
    # reflector \
    pacman --noconfirm -Syu reflector && \
    reflector --country France --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && \
    \
    # aur support \
    pacman --noconfirm -Sy \
    wget \
    base-devel \
    git &&\
    \
    # yay \
    cd /tmp && \
    wget https://github.com/Jguer/yay/releases/download/${YAY_VERSION}/yay_${YAY_VERSION#v*}_x86_64.tar.gz && \
    tar xvzf yay_${YAY_VERSION#v*}_x86_64.tar.gz && \
    cp yay_${YAY_VERSION#v*}_x86_64/yay /usr/bin && \
    cd / && rm -Rf /tmp/* && \
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd && \
    echo "yay:x:20002:" >> /etc/group  && \
    echo "yay:x:20002::::::" >> /etc/shadow && \
    echo $'Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay \n\
    %yay ALL=(ALL) NOPASSWD: PACMAN' > /etc/sudoers.d/yay && \
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf && \
    mkdir -p /var/lib/yay && chown yay: /var/lib/yay && \
    passwd -l root && \
    \
    # packages \
    su -c $"yay -Sy --noconfirm \
    efibootmgr \
    syslinux \
    \
    linux \
    linux-headers \
    intel-ucode \
    dkms \
    \
    gptfdisk \
    hdparm \
    smartmontools \
    xfsprogs \
    mdadm \
    dosfstools \
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
    usbutils \
    net-tools \
    bind-tools \
    conntrack-tools \
    iproute2 \
    " yay && \
    \
    # cleanup \
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*

ADD rootfs /

# some cleanup
# RUN rm -Rf /var/log
