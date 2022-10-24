FROM archlinux:base-20221016.0.94779

RUN pacman -Sy &&\
    pacman-key --init &&\
    pacman -S --noconfirm archlinux-keyring &&\
    pacman --noconfirm -Su \
        grep \
        file \
        sudo \
        archiso

# ADD rootfs /

# cd /usr/share/archiso/configs/releng
# ./build.sh