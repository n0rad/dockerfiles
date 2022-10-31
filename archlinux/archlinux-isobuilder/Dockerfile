FROM archlinux:base-20221030.0.98412

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