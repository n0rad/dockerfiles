FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
    rsync \
    \
    open-iscsi \
    cni-plugins \
    containerd \
    kubelet \
    kubectl \
    kubeadm \
    crictl

ADD rootfs /

# some cleanup
RUN rm -Rf /var/log /etc/cni/net.d
