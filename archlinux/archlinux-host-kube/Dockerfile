FROM n0rad/archlinux-host:1.230727.1342-H8bac33c

RUN pacman -Syu --noconfirm &&\
    pacman -Rdd iptables --noconfirm && pacman -S iptables-nft --noconfirm &&\
    pacman -S --noconfirm \
      open-iscsi nfs-utils rsync \
      xfsprogs \
      ipset ipvsadm \
      cri-o crictl cni-plugins runc \
      kubelet kubectl kubeadm \
    &&\
    # special arch
    case $(uname -m) in \
      x86_64) sudo -u yay yay -S --noconfirm nvidia-container-toolkit nvidia-470xx-dkms;; \
    esac &&\
    # cleanup
    rm -Rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /var/lib/yay/.cache
