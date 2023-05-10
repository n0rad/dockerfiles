FROM n0rad/manjaro-host:1.230510.1921-H2f07322

ADD rootfs / 
RUN pacman -Rdd iptables --noconfirm && pacman -Sy iptables-nft --noconfirm &&\
    /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
