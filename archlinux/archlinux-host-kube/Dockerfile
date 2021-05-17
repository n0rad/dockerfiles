FROM n0rad/archlinux-host


# not sure but iptables-nft seems to break kuberouter in some cases
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
    pacman --noconfirm -Rdd iptables-nft && pacman --noconfirm -S iptables &&\
    rm -Rf /var/log /etc/cni/net.d /var/cache/pacman /var/lib/pacman/sync &&\
    rm -Rf /etc/cni/net.d

#ADD rootfs /
