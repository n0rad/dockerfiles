FROM n0rad/archlinux-host:1.230727.1725-H3948044

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      gnome \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
