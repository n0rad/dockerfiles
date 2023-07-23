FROM n0rad/archlinux-host:1.230723.1352-Hcb13aef

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      xorg xorg-xinit xf86-video-intel \
      xterm \
      accountsservice lightdm lightdm-gtk-greeter \
      pulseaudio \
      networkmanager \
      network-manager-applet \
      mate mate-extra \
      \
      wireguard-tools \
      wine \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
