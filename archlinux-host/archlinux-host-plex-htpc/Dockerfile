FROM n0rad/archlinux-host:1.230720.704-H10a75d8-arm64

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
