FROM n0rad/archlinux-host:1.231020.930-H12d4c97

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      gnome \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
