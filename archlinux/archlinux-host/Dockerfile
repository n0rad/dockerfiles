FROM n0rad/archlinux:1.230722.2216-H96e2955

RUN \
    pacman -Syu --noconfirm &&\
    # yay
    pacman -S --needed --noconfirm git base-devel &&\
    useradd -d /var/lib/yay -m -s /usr/bin/sh -u 20002 -U yay &&\
    echo -e "%yay ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/yay" > /etc/sudoers.d/yay &&\
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf &&\
    sudo -u yay sh -c 'git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && cd /tmp/yay-bin && makepkg -si --noconfirm' &&\
    \
    # install special arch packages
    case $(uname -m) in \
      aarch64) echo 'MAKEFLAGS="-j$(nproc)"' >> /etc/makepkg.conf && sudo -u yay yay -S linux-aarch64-orangepi5 --noconfirm ;; \
      x86_64) pacman -S --noconfirm syslinux linux linux-headers efibootmgr intel-ucode;; \
      *) echo "unsupported arch"; exit 1;; \
    esac &&\
    # install packages
    sudo -u yay yay -S --noconfirm \
      systemd-sysvcompat dkms \
      gptfdisk hdparm mdadm dosfstools smartmontools \
      pciutils usbutils net-tools bind-tools conntrack-tools \
      ethtool socat iputils iproute2 \
      sudo grep curl wget downgrade \
      htop iftop lsof dfc psmisc ncdu tree nmon \
      openssh \
      vim tmux \
    &&\
    # cleanup
    rm -Rf /tmp/* /var/cache/pacman/* /var/lib/pacman/sync/*
