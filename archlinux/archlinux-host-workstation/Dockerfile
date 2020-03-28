FROM n0rad/archlinux-host

# packages
RUN echo $'\n\
    [multilib]\n\
    Include = /etc/pacman.d/mirrorlist\n' >> /etc/pacman.conf && \
    \
    su -c $"yay -Sy --noconfirm \
    linux-headers linux-firmware \
    xterm xsel \
    xorg xorg-xinit xf86-video-intel \
    \
    accountsservice networkmanager \
    openssh rsync \
    \
    virtualbox virt-manager vinagre qemu \
    pulseaudio \
    blueman bluez \
    wine winetricks \
    xdg-user-dirs \
    \
    lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
    mate mate-extra \
    network-manager-applet \
    mint-x-icons numix-themes-darkblue \
    mate-multiload-ng-applet-gtk3 mate-menu mate-tweak \
    \
    cpio \
    p7zip \
    downgrade \
    bc yq jq ipcalc \
    encfs \
    wavemon powertop \
    tcpdump wireshark-qt gnu-netcat \
    bash-completion \
    zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting oh-my-zsh-git \
    expect grc pygmentize z thefuck \
    dconf-editor \
    keepassxc gnome-keyring \
    guake \
    \
    docker docker-compose \
    kubeadm-bin kubectl-bin kubelet-bin k9s \
    kubeseal minikube-bin fluxctl-bin stern-bin \
    google-cloud-sdk \
    \
    firefox chromium \
    gimp gnome-calculator \
    imagemagick \
    \
    go goreleaser \
    goss-bin \
    gradle maven \
    npm \
    python-pip \
    hey \
    vlc ffmpeg x264 x265 flac \
    youtube-dl \
    \
    visual-studio-code-bin intellij-idea-community-edition goland goland-jre \
    meld tig tk \
    \
    seafile-client-git \
    sane xsane cups \
    sshfs \
    redshift quicktile-git \
    screen tmux \
    \
    openvpn networkmanager-openvpn teleport-bin \
    terraform \
    \
    " yay

# some cleanup
RUN rm -Rf /var/log