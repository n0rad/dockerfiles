FROM n0rad/archlinux-host


RUN pacman --noconfirm -Rdd iptables &&\
    \
    pacman --noconfirm -Syu \
    rsync \
    open-iscsi \
    nfs-utils \
    cni-plugins \
    cri-o \
    kubelet \
    kubectl \
    kubeadm \
    crictl &&\
    \
    rm -Rf /var/cache/pacman /var/lib/pacman/sync &&\
    rm -Rf /etc/cni/net.d

ADD rootfs /
