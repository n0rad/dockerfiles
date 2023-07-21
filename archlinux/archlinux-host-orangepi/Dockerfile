FROM n0rad/archlinux-host:1.230720.704-H10a75d8


ADD rootfs /

RUN echo 'MAKEFLAGS="-j9"' >> /etc/makepkg.conf &&\
    cd /tmp/linux-aarch64-orangepi5 &&\
    sudo chown -R yay: . &&\
    su -c "makepkg -s" yay

#RUN  su -c $"yay -Sy --noconfirm \
#    aur/linux-aarch64-orangepi5 \
#   " yay

LABEL platform="linux/arm64"
