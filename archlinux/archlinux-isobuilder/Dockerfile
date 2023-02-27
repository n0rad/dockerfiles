FROM archlinux:base-20230226.0.129555

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