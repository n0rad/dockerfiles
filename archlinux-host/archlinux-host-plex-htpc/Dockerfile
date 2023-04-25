FROM n0rad/archlinux-host:1.230425.1129-H77d2d2c

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
