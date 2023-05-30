FROM archlinux:base-20230528.0.154326

RUN pacman -Sy --noconfirm linux intel-ucode systemd-sysvcompat openssh sudo && \
    passwd -l root && \
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*

LABEL platform="linux/amd64"
