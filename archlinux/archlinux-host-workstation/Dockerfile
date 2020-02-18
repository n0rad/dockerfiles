FROM n0rad/archlinux-host

# reflector
RUN pacman --noconfirm -Syu \
    reflector && \
    reflector --country France --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# yay
RUN pacman --noconfirm -Syu base-devel git && \
    mkdir /tmp/yay && \
    curl -L https://github.com/Jguer/yay/releases/download/v9.4.4/yay_9.4.4_x86_64.tar.gz | tar xz --strip 1 -C /tmp/yay && \
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd && \
    echo "yay:x:20002:" >> /etc/group  && \
    echo "yay:x:20002::::::" >> /etc/shadow && \
    echo $'Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay \n\
    %yay ALL=(ALL) NOPASSWD: PACMAN' > /etc/sudoers.d/yay && \
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf && \
    mkdir /var/lib/yay && chown yay: /var/lib/yay && \
    su -c "/tmp/yay/yay -S yay-bin --noconfirm" yay && \
    rm -Rf /tmp/yay 

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
    expect grc z thefuck \
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
    seafile-client \
    sane xsane cups \
    sshfs \
    redshift quicktile-git \
    screen tmux \
    \
    openvpn networkmanager-openvpn teleport-bin \
    terraform \
    \
    " yay

# RUN su -c $"yay -Syu --noconfirm \
#      \
#     " yay

# some cleanup
RUN rm -Rf /var/log
