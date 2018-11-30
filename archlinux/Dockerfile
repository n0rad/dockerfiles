FROM archlinux/base

RUN pacman --noconfirm -Syu \
    base-devel \
    git \
    sudo \
    vim \
    htop \
    dfc \
    grep \
    curl \
    wget \
    iputils \
    dnsutils \
    p7zip \
    less

# yaourt
RUN echo -e "Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yaourt \n\
    %yaourt ALL=(ALL) NOPASSWD: PACMAN" > /etc/sudoers.d/yaourt && \
    groupadd yaourt && \
    useradd -s /usr/bin/nologin -g yaourt yaourt && \
    cd /tmp && \
    sudo -u yaourt git clone https://aur.archlinux.org/package-query.git && \
    cd /tmp/package-query && \
    yes | sudo -u yaourt makepkg -si && \
    cd /tmp && \
    sudo -u yaourt git clone https://aur.archlinux.org/yaourt.git && \
    cd /tmp/yaourt && \
    yes | sudo -u yaourt makepkg -si && \
    sudo -u yaourt rm -rf /tmp/package-query /tmp/yaourt && \
    sudo -u yaourt yaourt --version
