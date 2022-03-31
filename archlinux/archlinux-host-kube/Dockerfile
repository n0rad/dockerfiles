FROM n0rad/archlinux-host

RUN pacman -Rdd --noconfirm iptables && pacman -Sy iptables-nft --noconfirm &&\
    su -c $"yay -S --noconfirm \
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
    kubelet \
    kubectl \
    kubeadm \
    \
    " yay &&\
    \
    rm -Rf /tmp/* /var/cache/pacman /var/lib/pacman/sync /etc/cni /var/log/journal

ADD rootfs /
