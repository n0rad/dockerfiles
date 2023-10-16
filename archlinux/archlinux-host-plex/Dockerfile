FROM n0rad/archlinux-host:1.230727.1725-H3948044

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      xorg xorg-xinit \
      xterm \
      accountsservice lightdm lightdm-gtk-greeter \
      pipewire \
      networkmanager network-manager-applet \
      mate mate-extra \
      unclutter \
      flatpak \
    &&\
    # special arch
    case $(uname -m) in \
      x86_64) flatpak install -y flathub tv.plex.PlexHTPC;; \
    esac &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
