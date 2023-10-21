FROM n0rad/archlinux-host:1.231021.1355-Hb89ccaa

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      gnome \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
