FROM n0rad/archlinux-host:1.230503.206-Hc9f577a

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm && pacman -Sy iptables-nft --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
