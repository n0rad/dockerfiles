FROM n0rad/archlinux-host:1.240519.921-Hb7ffa10

RUN pacman -Sy --noconfirm archlinux-keyring &&\
    pacman -Syu --noconfirm &&\
    sudo -u yay yay -S --noconfirm \
      plymouth plymouth-theme-monoarch plymouth-theme-arch-logo \
      networkmanager bluez \
      \
      gnome gnome-browser-connector gnome-bluetooth-3.0 pipewire pipewire-pulse dconf-editor \
      nemo mint-x-icons \
      firefox chromium \
      keepassxc sops guake \
      syncthing \
      gimp meld \
      \
      wavemon powertop \
      less \
      zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
      grc pygmentize z thefuck \
      bc yq jq ipcalc \
      sshfs \
      tmux  xsel \
      mplayer ffmpeg x264 x265 flac \
      docker docker-buildx docker-compose kubectl k9s helm kubeseal stern \
      terraform \
      go npm yarn gradle maven \
      tig tk the_silver_searcher github-cli \
      goland graphviz \
      flux-bin \
      powerline-go \
      google-cloud-cli  \
      terraform-docs-bin \
      oh-my-zsh-git \
      tmux-cssh \
      quicktile-git \
    &&\
    case $(uname -m) in \
      aarch64) \
        pacman -S --noconfirm linux-firmware; \
        ;; \
      x86_64)  \
        sudo -u yay yay -Sy --noconfirm \
          code \
          goss-bin \
          syncthing-gtk lib-appindicator-gtk3 \
          git-trim-bin \
          google-cloud-cli-gke-gcloud-auth-plugin \
          wine winetricks dxvk-bin \
        ;; \
    esac &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache


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
#    gvfs-mtp \
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
#    xdg-user-dirs \
#    mint-x-icons numix-themes-darkblue \
#     \
