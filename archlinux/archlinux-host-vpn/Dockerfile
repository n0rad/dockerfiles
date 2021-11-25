FROM n0rad/archlinux-host

RUN echo $'\n\
    [multilib]\n\
    Include = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf && \
    \
    pacman --noconfirm -Syu \
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
