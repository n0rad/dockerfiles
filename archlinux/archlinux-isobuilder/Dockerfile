FROM archlinux:base-20230205.0.123931

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

# ADD rootfs /

# cd /usr/share/archiso/configs/releng
# ./build.sh