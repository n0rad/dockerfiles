FROM n0rad/archlinux-host


RUN su -c $"yay -Sy --noconfirm \
    rsync \
    open-iscsi \
    ipset \
    ipvsadm \
    nfs-utils \
    cni-plugins \
    cri-o \
    crictl \
    nvidia-container-toolkit \
    nvidia-470xx-dkms \
    tmux \
    \
    " yay &&\
    \
    pacman -Rdd --noconfirm iptables && pacman -Sy iptables-nft && \
    \
    cd /tmp && \
    # VERSION=v1.23.5 && \
    VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    wget -q "https://dl.k8s.io/$VERSION/kubernetes-node-linux-amd64.tar.gz" && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin && \
    rm -Rf /tmp/* /var/cache/pacman /var/lib/pacman/sync /etc/cni /var/log/journal

ADD rootfs /
