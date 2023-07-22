FROM n0rad/archlinux-host:1.230721.2232-H00a79de-arm64

ADD rootfs / 
RUN /etc/updater/system/update.sh &&\
    # cleanup &&\
    yay -c --noconfirm &&\
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache

LABEL platform="linux/amd64"
