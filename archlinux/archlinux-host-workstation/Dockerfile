FROM n0rad/archlinux-host:1.231021.1355-Hb89ccaa

RUN echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf &&\
    pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      networkmanager \
      gnome gnome-browser-connector gnome-bluetooth-3.0 \
      \
      bc yq jq ipcalc \
      \
      sshfs \
      wine winetricks \
      \
      bluez \
      firefox chromium \
      keepassxc \
      \
      ffmpeg x264 x265 flac \
      \
      docker \
      \
      go npm gradle maven \
      \
      meld tig tk the_silver_searcher github-cli \
    &&\
    sudo -u yay yay -S --noconfirm \
      # legacy app tray icon support in gnome3, like syncthing-gtk
      lib-appindicator-gtk3 \
      dxvk-bin \
      syncthing-gtk \
      goss-bin \
      git-trim-bin \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache



#    usbutils \
#    linux-headers linux-firmware \
#    xterm xsel \
#    xorg xorg-xinit vulkan-intel \
#    \
#    accountsservice networkmanager \
#    openssh rsync \
#    \
#    pulseaudio pulseaudio-bluetooth \
#    blueman bluez \
#    wine winetricks dxvk-bin \
#    xdg-user-dirs \
#    \
#    lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
#    mate mate-extra \
#    network-manager-applet gvfs-mtp \
#    mint-x-icons numix-themes-darkblue \
#    mate-multiload-ng-applet-gtk3 mate-menu mate-tweak \
#    python2-bin python2-xlib playerctl \
#    \
#    cpio \
#    p7zip \
#    downgrade \
#
#    encfs \
#    wavemon powertop \
#    tcpdump wireshark-qt gnu-netcat \
#    bash-completion \
#    zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
#    powerline-go oh-my-zsh-git \
#    expect grc pygmentize z thefuck \
#    dconf-editor \
#    keepassxc x11-ssh-askpass \
#    guake \
#    \
#    kubeadm-bin kubectl-bin kubelet-bin k9s helm \
#    kubeseal flux-bin stern-bin \
#    google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin \
#    \
#    libreoffice-fresh obsidian \
#    gimp gnome-calculator \
#    imagemagick perl-image-exiftool webp-pixbuf-loader \
#    \
#    python-pip \
#    hey \
#    vlc ffmpeg x264 x265 flac \
#    yt-dlp \
#    \
#    visual-studio-code-bin intellij-idea-community-edition goland goland-jre \
#    meld tig tk the_silver_searcher github-cli git-trim-bin \
#    \
#    syncthing-gtk-python3 \
#    sane xsane cups pdftk tesseract tesseract-data-fra \
#    gutenprint \
#    sshfs \
#    redshift quicktile-git \
#    screen tmux tmux-cssh \
#    \
#    terraform terraform-docs-bin \
