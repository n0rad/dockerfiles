FROM n0rad/archlinux-host:1.230627.334-Hfd3bc25

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
