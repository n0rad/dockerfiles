FROM n0rad/archlinux:1.230722.2216-H96e2955

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

# cd /usr/share/archiso/configs/releng
# ./build.sh