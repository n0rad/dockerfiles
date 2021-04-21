FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
    rsync \
    \
    docker \
    open-iscsi \
    cni-plugins

# kube
RUN cd /tmp && \
    wget -q "https://dl.k8s.io/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/kubernetes-node-linux-amd64.tar.gz" && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin && \
    rm -Rf /tmp/*

ADD rootfs /

# some cleanup
RUN rm -Rf /var/log /etc/cni/net.d
