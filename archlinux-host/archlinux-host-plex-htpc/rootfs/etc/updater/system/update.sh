#!/bin/bash
set -e
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh

system_update " \
    xorg xorg-xinit xf86-video-intel \
    xterm \
    accountsservice lightdm lightdm-gtk-greeter \
    pulseaudio \
    networkmanager \
    network-manager-applet \
    mate mate-extra \
    unclutter \
    flatpak
"

#flatpak install flathub tv.plex.PlexHTPC
