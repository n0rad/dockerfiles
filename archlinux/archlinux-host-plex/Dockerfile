FROM n0rad/archlinux-host:1.231020.1414-Hdc34f0c

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      xorg xorg-xinit \
      accountsservice lightdm lightdm-gtk-greeter \
      openbox \
    &&\
    # special arch
    case $(uname -m) in \
      x86_64) pacman -S flatpak --noconfirm && flatpak install -y flathub tv.plex.PlexHTPC;; \
      aarch64) echo TODO ;; \
    esac &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
