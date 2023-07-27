FROM n0rad/archlinux-host:1.230727.824-Haf71525

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      xorg xorg-xinit \
      xterm \
      accountsservice lightdm lightdm-gtk-greeter \
      pulseaudio \
      networkmanager \
      network-manager-applet \
      mate mate-extra \
      unclutter \
      flatpak \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
