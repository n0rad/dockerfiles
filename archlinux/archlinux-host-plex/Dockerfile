FROM n0rad/archlinux-host:1.231021.1355-Hb89ccaa

COPY rootfs /

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      xorg xorg-xinit \
      accountsservice lightdm lightdm-gtk-greeter \
      pulseaudio iwd \
      xterm unclutter \
    &&\
    git clone https://git.suckless.org/dwm /tmp/dwm &&\
    (cd /tmp/dwm && git checkout 6.4 && GIT_COMMITTER_NAME=me EMAIL=me@myself git am /tmp/0001-no-bar-no-border.patch && make && mv dwm /usr/bin ) &&\
    # special arch
    case $(uname -m) in \
      x86_64) pacman -S flatpak --noconfirm && flatpak install -y flathub tv.plex.PlexHTPC;; \
      aarch64) echo TODO ;; \
    esac &&\
    # cleanup
    rm -Rf /tmp/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
