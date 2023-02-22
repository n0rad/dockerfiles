FROM archlinux:base-20230219.0.127702

RUN pacman -Sy --noconfirm linux intel-ucode systemd-sysvcompat openssh sudo && \
    passwd -l root && \
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*
