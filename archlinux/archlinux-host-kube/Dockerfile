FROM n0rad/archlinux-host:1.240519.921-Hb7ffa10

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
