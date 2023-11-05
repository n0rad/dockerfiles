FROM n0rad/archlinux-host:1.231104.1416-Hdcae509

RUN pacman -Syu --noconfirm &&\
    pacman -Rdd iptables --noconfirm && pacman -S iptables-nft --noconfirm &&\
    pacman -S --noconfirm \
      open-iscsi nfs-utils rsync \
      xfsprogs \
      ipset ipvsadm \
      cri-o crictl cni-plugins runc \
      kubelet kubectl kubeadm \
    &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
