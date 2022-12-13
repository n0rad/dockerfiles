FROM n0rad/archlinux-host:1.221212.2336-Hee74abb

ADD rootfs / 
RUN /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
