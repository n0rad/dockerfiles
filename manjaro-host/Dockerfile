FROM manjarolinux/base:20230702

ADD rootfs / 
RUN /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
