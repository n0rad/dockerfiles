FROM n0rad/archlinux-host:1.231022.1346-Hac246fa

RUN pacman -Syu --noconfirm &&\
    pacman -S --noconfirm \
      networkmanager bluez \
      \
      gnome gnome-browser-connector gnome-bluetooth-3.0 pipewire pipewire-pulse dconf-editor \
      firefox chromium \
      keepassxc guake \
      gimp code meld \
      \
      wavemon powertop \
      less \
      zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting oh-my-zsh-git \
      grc pygmentize z thefuck \
      bc yq jq ipcalc \
      sshfs \
      tmux tmux-cssh xsel \
      ffmpeg x264 x265 flac \
      docker kubectl k9s helm kubeseal stern \
      terraform terraform-docs-bin \
      go npm yarn gradle maven \
      tig tk the_silver_searcher github-cli \
    &&\
    sudo -u yay yay -S --noconfirm \
      # legacy app tray icon support in gnome3, like syncthing-gtk
      lib-appindicator-gtk3 \
      goland \
      flux-bin \
      powerline-go \
      google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache


# TODO: not available on arm
#      goss-bin \
#      git-trim-bin \
#      syncthing-gtk \




#echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf &&\
#      wine winetricks dxvk-bin \

# gnome-shell-extension-appindicator \
# gnome-shell-extension-dash-to-panel \
# gnome-shell-extension-order-icons-git \
# gnome-shell-extension-system-monitor-next-git \
# gnome-shell-extension-weather-oclock-git \
# gnome-shell-extension-wallpaper-slideshow
# gnome-shell-extension-executor
# gnome-shell-extension-workspace-indicator
# gnome-shell-extension-workspace-matrix



#    usbutils \
#    vulkan-intel \
#    accountsservice \
#    rsync \
#    xdg-user-dirs \
#    gvfs-mtp \
#    mint-x-icons numix-themes-darkblue \
#    cpio \
#    p7zip \
#    tcpdump wireshark-qt gnu-netcat \
#    x11-ssh-askpass \
#    libreoffice-fresh obsidian \
#    imagemagick perl-image-exiftool webp-pixbuf-loader \
#    python-pip \
#    hey \
#    vlc \
#    yt-dlp \
#    sane xsane cups pdftk tesseract tesseract-data-fra \
#    gutenprint \
#    quicktile-git \
