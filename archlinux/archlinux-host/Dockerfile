FROM n0rad/archlinux

RUN pacman --noconfirm -Syu \
    ntp \
    openssh \
    linux \
    syslinux \
    systemd-sysvcompat \
    gptfdisk \
    usbutils \
    pciutils \
    bash-completion

ADD rootfs /
