FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
        xorg xorg-xinit xf86-video-intel \
        xterm \
        accountsservice lightdm lightdm-gtk-greeter \
        pulseaudio \
        networkmanager \
        network-manager-applet \
        mate mate-extra \
        \
        wireguard-tools \
        wine


# some cleanup
RUN rm -Rf /var/log
