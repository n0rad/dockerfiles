FROM archlinux:base-20230521.0.152478

RUN pacman -Sy &&\
    pacman-key --init &&\
    pacman -S --noconfirm archlinux-keyring &&\
    pacman --noconfirm -Su \
        grep \
        file \
        sudo \
        archiso \
        go \
        git \
        make \
        gcc

LABEL platform="linux/amd64"

# ADD rootfs /

# cd /usr/share/archiso/configs/releng
# ./build.sh