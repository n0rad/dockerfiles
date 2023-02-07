FROM archlinux:base-20230205.0.123931

RUN pacman -Sy --noconfirm linux intel-ucode systemd-sysvcompat openssh sudo && \
    passwd -l root && \
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*
