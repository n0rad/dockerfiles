FROM n0rad/archlinux:1.230721.2219-H772ec78

RUN \
    # yay dependencies
    pacman -Sy --needed wget git base-devel --noconfirm &&\
    # setup yay user
    sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf &&\
    echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd &&\
    echo "yay:x:20002:" >> /etc/group &&\
    echo "yay:x:20002::::::" >> /etc/shadow &&\
    echo -e "Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay\n%yay ALL=(ALL) NOPASSWD: PACMAN" > /etc/sudoers.d/yay &&\
    # run yay to install yay
    YAY_VERSION=v11.2.0 &&\
    wget -qO- https://github.com/Jguer/yay/releases/download/${YAY_VERSION}/yay_${YAY_VERSION#v*}_$(uname -m).tar.gz | tar xvz -C /tmp &&\
    echo -e "Cmnd_Alias  PACMAN = /usr/bin/pacman, /tmp/yay_${YAY_VERSION#v*}_$(uname -m)/yay\n%yay ALL=(ALL) NOPASSWD: PACMAN" > /etc/sudoers.d/tmp_yay &&\
    su -c "/tmp/yay_${YAY_VERSION#v*}_$(uname -m)/yay -S yay-bin --noconfirm" yay &&\
    rm /etc/sudoers.d/tmp_yay &&\
    \
    # install packages \
    su -c $"yay -Sy --noconfirm \
      gptfdisk hdparm mdadm dosfstools smartmontools \
      pciutils usbutils net-tools bind-tools conntrack-tools \
      ethtool socat iputils iproute2 \
      sudo grep curl wget downgrade \
      htop iftop lsof dfc psmisc ncdu tree nmon \
      openssh \
      vim tmux \
     " yay &&\
    # cleanup
    rm -Rf /tmp/* /var/cache/pacman/* /var/lib/pacman/sync/*
