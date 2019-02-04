from n0rad/archlinux-host

RUN pacman --noconfirm -S \
    bridge-utils \
    inetutils \
    net-tools \
    iotop \
    docker \
    nmon \
    tcpdump \
    dnsutils \
    rsync \
    bc \
    unzip \
    cpio \
    dmidecode \
    traceroute \
    sshfs \
    parted \
    netctl \
    lsof \
    jq \
    intel-ucode \
    mdadm \
    ebtables

RUN sudo -u yaourt yaourt --noconfirm -S kubernetes-bin


#iptables-nft
#cni
#crictl-bin

#net.ipv4.conf.default.rp_filter = 1
#net.ipv4.conf.all.rp_filter = 1
#RUN nohup bash -c "dockerd &" && \
#    sleep 5 && \
#   kubeadm config images pull

#RUN kubeadm config images pull

RUN systemctl enable \
    kubelet.service
