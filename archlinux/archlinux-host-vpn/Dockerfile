FROM n0rad/archlinux-host:1.240519.921-Hb7ffa10

RUN \
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf &&\
    pacman -Syu --noconfirm &&\
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
