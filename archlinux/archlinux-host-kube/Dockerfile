FROM n0rad/archlinux-host


RUN pacman --noconfirm -Syu \
    rsync \
    open-iscsi \
    nfs-utils \
    cni-plugins \
    containerd \
    crictl &&\
    \
    cd /tmp && \
    VERSION=v1.21.1 && \
    VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    wget -q "https://dl.k8s.io/$VERSION/kubernetes-node-linux-amd64.tar.gz" && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin && \
    rm -Rf /tmp/* /var/cache/pacman /var/lib/pacman/sync /etc/cni/net.d

ADD rootfs /
