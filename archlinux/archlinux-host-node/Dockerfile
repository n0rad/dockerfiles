FROM n0rad/archlinux-host:1.240519.921-Hb7ffa10

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
