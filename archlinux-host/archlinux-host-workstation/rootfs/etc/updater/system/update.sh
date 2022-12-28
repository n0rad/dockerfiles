#!/bin/bash
set -e
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh


grep "^\[multilib\]" /etc/pacman.conf || cat <<EOT >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOT

system_update  " \
    usbutils \
    linux-headers linux-firmware \
    xterm xsel \
    xorg xorg-xinit vulkan-intel \
    \
    accountsservice networkmanager \
    openssh rsync \
    \
    pulseaudio pulseaudio-bluetooth \
    blueman bluez \
    wine winetricks dxvk-bin \
    xdg-user-dirs \
    \
    lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
    mate mate-extra \
    network-manager-applet gvfs-mtp \
    mint-x-icons numix-themes-darkblue \
    mate-multiload-ng-applet-gtk3 mate-menu mate-tweak \
    python2-bin python2-xlib playerctl \
    \
    cpio \
    p7zip \
    downgrade \
    bc yq jq ipcalc \
    encfs \
    wavemon powertop \
    tcpdump wireshark-qt gnu-netcat \
    bash-completion \
    zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
    powerline-go oh-my-zsh-git \
    expect grc pygmentize z thefuck \
    dconf-editor \
    keepassxc x11-ssh-askpass \
    guake \
    \
    docker \
    kubeadm-bin kubectl-bin kubelet-bin k9s helm \
    kubeseal flux-bin stern-bin \
    google-cloud-sdk gke-gcloud-auth-plugin \
    \
    firefox chromium \
    libreoffice-fresh obsidian \
    gimp gnome-calculator \
    imagemagick perl-image-exiftool webp-pixbuf-loader \
    \
    go \
    goss-bin \
    gradle maven \
    npm \
    python-pip \
    hey \
    vlc ffmpeg x264 x265 flac \
    yt-dlp \
    \
    visual-studio-code-bin intellij-idea-community-edition goland goland-jre \
    meld tig tk the_silver_searcher \
    \
    syncthing-gtk-python3 \
    sane xsane cups pdftk tesseract tesseract-data-fra \
    gutenprint \
    sshfs \
    redshift quicktile-git \
    screen tmux tmux-cssh \
    \
    terraform \

"
