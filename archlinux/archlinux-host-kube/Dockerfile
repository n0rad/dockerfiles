FROM archlinux/base

RUN pacman --noconfirm -Syu \
    openssh \
    linux \
    docker \
    intel-ucode \
    curl \
    wget \
    mdadm \
    htop \
    dfc \
    grep \
    sudo \
    vim \
    ebtables \
    ethtool \
    socat \
    iputils \
    net-tools \
    conntrack-tools \
    iproute2

RUN cd /tmp && \
    wget -q https://dl.k8s.io/v1.13.3/kubernetes-node-linux-amd64.tar.gz && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin

ADD rootfs /

# do not allow empty root login
RUN passwd -l root
