FROM archlinux:base-20230625.0.160368

RUN pacman -Sy --noconfirm linux intel-ucode systemd-sysvcompat openssh sudo && \
    passwd -l root && \
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*

LABEL platform="linux/amd64"
