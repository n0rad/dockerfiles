FROM n0rad/archlinux:1.240519.901-Hb7ffa10

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

# cd /usr/share/archiso/configs/releng
# ./build.sh