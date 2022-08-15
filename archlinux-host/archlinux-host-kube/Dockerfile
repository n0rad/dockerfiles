FROM n0rad/archlinux-host:1.220815.950-Hba72bcb

ADD rootfs / 
RUN /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
