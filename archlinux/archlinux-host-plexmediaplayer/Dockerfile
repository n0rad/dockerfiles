FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
    base-devel \
    git

# yay
RUN cd /tmp && \
    wget https://github.com/Jguer/yay/releases/download/v9.4.4/yay_9.4.4_x86_64.tar.gz && \
    tar xvzf yay_9.4.4_x86_64.tar.gz && \
    cp yay_9.4.4_x86_64/yay /usr/bin && \
    cd / && rm -Rf /tmp/* && \
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd && \
    echo "yay:x:20002:" >> /etc/group  && \
    echo "yay:x:20002::::::" >> /etc/shadow && \
    echo $'Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay \n\
    %yay ALL=(ALL) NOPASSWD: PACMAN' > /etc/sudoers.d/yay && \
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf && \
    mkdir /var/lib/yay && chown yay: /var/lib/yay

RUN pacman --noconfirm -Syu \
        xorg xorg-xinit xf86-video-intel \
        xterm \
        accountsservice lightdm lightdm-gtk-greeter \
        mate mate-extra
        
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
