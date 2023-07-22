FROM n0rad/archlinux:1.230722.836-H9796174

RUN \
    pacman -Syu &&\
    # yay dependencies
    pacman -S --needed --noconfirm wget git base-devel &&\
    # setup yay user
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf &&\
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd &&\
    echo "yay:x:20002:" >> /etc/group &&\
    echo "yay:x:20002::::::" >> /etc/shadow &&\
    echo -e "%yay ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/yay" > /etc/sudoers.d/yay &&\
    mkdir -p /var/lib/yay && chown yay: /var/lib/yay &&\
    # run yay to install yay
    YAY_VERSION=v11.2.0 &&\
    wget -qO- https://github.com/Jguer/yay/releases/download/${YAY_VERSION}/yay_${YAY_VERSION#v*}_$(uname -m).tar.gz | tar xvz -C /tmp &&\
    echo -e "%yay ALL=(ALL) NOPASSWD: /usr/bin/pacman, /tmp/yay_${YAY_VERSION#v*}_$(uname -m)/yay" > /etc/sudoers.d/tmp_yay &&\
    su -c "/tmp/yay_${YAY_VERSION#v*}_$(uname -m)/yay -S yay-bin --noconfirm" yay &&\
    rm /etc/sudoers.d/tmp_yay &&\
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
