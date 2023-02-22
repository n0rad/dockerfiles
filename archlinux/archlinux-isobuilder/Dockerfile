FROM archlinux:base-20230219.0.127702

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