FROM n0rad/archlinux-host:1.231020.1414-Hdc34f0c

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      gnome \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
