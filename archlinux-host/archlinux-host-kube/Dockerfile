FROM n0rad/archlinux-host:1.230718.4-H2f62928

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm && pacman -Sy iptables-nft --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
