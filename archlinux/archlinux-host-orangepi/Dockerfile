FROM n0rad/archlinux-host:1.230720.704-H10a75d8


ADD rootfs /

RUN echo 'MAKEFLAGS="-j9"' >> /etc/makepkg.conf &&\
    cd /builc/linux-aarch64-orangepi5 &&\
    pacman -Sy bc dtc uboot-tools --noconfirm &&\
    sudo chown -R yay: . &&\
    su -c "makepkg -s" yay &&\
    makepkg -i
 \
    #RUN  su -c $"yay -Sy --noconfirm \
#    aur/linux-aarch64-orangepi5 \
#   " yay

LABEL platform="linux/arm64"
