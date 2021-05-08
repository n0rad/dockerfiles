FROM n0rad/archlinux-host

# remove iptables so we can install iptables-nft
RUN pacman --noconfirm -Rdd iptables

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
