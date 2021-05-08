FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
    rsync \
    \
    docker \
    open-iscsi \
    cni-plugins \
    kubelet \
    kubectl \
    kubeadm \
    crictl

ADD rootfs /

# some cleanup
RUN rm -Rf /var/log /etc/cni/net.d
