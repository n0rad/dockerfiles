FROM n0rad/archlinux-host

RUN pacman --noconfirm -Syu \
    rsync \
    \
    docker \
    open-iscsi \
    cni-plugins

# kube
RUN cd /tmp && \
    wget -q "https://dl.k8s.io/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/kubernetes-node-linux-amd64.tar.gz" && \
    tar xzf kubernetes-node-linux-amd64.tar.gz && \
    mv kubernetes/node/bin/{kubelet,kubectl,kubeadm} /usr/bin

# memguarded
RUN curl -s https://api.github.com/repos/n0rad/memguarded/releases/latest \
    | grep "browser_download_url.*tar.gz" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | xargs curl -L \
    | tar xzf - --strip 1 -C /usr/bin


ADD rootfs /

# some cleanup
RUN rm -Rf /var/log
