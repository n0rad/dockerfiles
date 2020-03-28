FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
        xorg xorg-xinit xf86-video-intel \
        xterm \
        accountsservice lightdm lightdm-gtk-greeter \
        networkmanager \
        mate mate-extra \
        unclutter \
        docker

# plex
RUN cd /tmp && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-base-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-declarative-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-location-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-quickcontrols-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-tools-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-webchannel-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-webengine-595-5.9.5-1-x86_64.pkg.tar.xz' &&\
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-x11extras-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    wget 'https://github.com/cianmcgovern/archlinux-qt-5.9.5/releases/download/10-JAN-2020/qt5-xmlpatterns-595-5.9.5-1-x86_64.pkg.tar.xz' && \
    su -c "yay -U qt5-* --noconfirm" yay && \
    rm qt5-* && \
    su -c "yay -S plex-media-player-git --noconfirm" yay


ADD rootfs /

# some cleanup
RUN rm -Rf /var/log
