FROM n0rad/archlinux-host:1.230720.704-H10a75d8


ADD rootfs /

RUN echo 'MAKEFLAGS="-j9"' >> /etc/makepkg.conf &&\
    cd /build/linux-aarch64-orangepi5 && sudo chmod 777 .  &&\
    pacman -Sy &&\
    echo -e "%nobody ALL=(ALL) NOPASSWD: /usr/bin/pacman" > /etc/sudoers.d/nobody &&\
    sudo -u nobody makepkg -si

    #RUN  su -c $"yay -Sy --noconfirm \
#    aur/linux-aarch64-orangepi5 \
#   " yay

LABEL platform="linux/arm64"
