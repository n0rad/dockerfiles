FROM archlinux/base

RUN pacman --noconfirm -Syu \
    efibootmgr \
    syslinux \
    gptfdisk \
    linux \
    intel-ucode \
    mdadm \
    openssh \
    dhcpcd \
    sudo \
    curl \
    wget \
    htop \
    dfc \
    nmon \
    grep \
    vim \
    ebtables \
    ethtool \
    socat \
    iputils \
    net-tools \
    conntrack-tools \
    iproute2 \
    docker \
    cni-plugins

# kube
RUN cd /tmp && \
    wget -q https://dl.k8s.io/v1.13.3/kubernetes-node-linux-amd64.tar.gz && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin

ADD rootfs /

# do not allow empty root login
RUN passwd -l root
