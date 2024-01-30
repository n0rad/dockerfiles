FROM n0rad/archlinux-host:1.231104.1416-Hdcae509

RUN pacman -Sy archlinux-keyring --noconfirm &&\
    pacman -Su --noconfirm &&\
    sudo -u yay yay -S --noconfirm \
      prometheus-node-exporter \
      mergerfs \
      encfs \
      iwd \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
