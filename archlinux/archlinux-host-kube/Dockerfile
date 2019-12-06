FROM archlinux/base

RUN pacman --noconfirm -Syu \
    efibootmgr \
    syslinux \
    \
    linux \
    intel-ucode \
    \
    gptfdisk \
    hdparm \
    smartmontools \
    xfsprogs \
    mdadm \
    \
    openssh \
    haveged \
    \
    grep \
    sudo \
    curl \
    wget \
    \
    htop \
    iftop \
    dfc \
    psmisc \
    ncdu \
    nmon \
    iotop \
    \
    vim \
    \
    ebtables \
    ethtool \
    socat \
    iputils \
    net-tools \
    bind-tools \
    conntrack-tools \
    iproute2 \
    \
    rsync \
    keepalived \
    \
    docker \
    cni-plugins

# kube
RUN cd /tmp && \
    wget -q "https://dl.k8s.io/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/kubernetes-node-linux-amd64.tar.gz" && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin

ADD rootfs /

# do not allow empty root login
RUN passwd -l root

# some cleanup
RUN rm -Rf /var/log
