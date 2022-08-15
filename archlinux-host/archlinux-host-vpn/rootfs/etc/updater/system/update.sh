#!/bin/bash
set -e
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh


grep "^\[multilib\]" /etc/pacman.conf || cat <<EOT >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOT

system_update  " \
    xorg xorg-xinit xf86-video-intel \
    xterm \
    accountsservice lightdm lightdm-gtk-greeter \
    pulseaudio \
    networkmanager \
    network-manager-applet \
    mate mate-extra \
    \
    wireguard-tools \
    wine
"
