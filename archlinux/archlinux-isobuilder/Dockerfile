FROM archlinux:base-20230115.0.118859

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