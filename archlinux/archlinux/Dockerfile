FROM n0rad/archlinux:1.230719.1935-Hd54b5fd AS builder

ADD rootfs-builder /

# reinstall pacman to have the default config
RUN pacman-key --init && pacman-key --populate archlinux && (pacman-key --populate archlinuxarm || true) &&\
    mv /etc/pacman.conf /etc/pacman.conf-build &&\
    pacman -Sy pacman --noconfirm --config=/etc/pacman.conf-build &&\
    cat /etc/pacman.d/noextract.conf >> /etc/pacman.conf

RUN mkdir /archlinux && cd /archlinux &&\
    # Prepare FS \
    mkdir -m 0755 -p ./var/{cache/pacman/pkg,lib/pacman,log} ./{dev,run,etc} &&\
    mkdir -m 1777 -p ./tmp &&\
    mkdir -m 0555 -p ./{sys,proc} &&\
    ln -s /dev/null ./dev/null &&\
    # setup pacman config
    mkdir -p etc/ && cp /etc/pacman.conf etc/ && cat /etc/pacman.d/noextract.conf >> etc/pacman.conf &&\
    # Install base
    pacman -r . -Sy --noconfirm base &&\
    # Add specific arch fs files
    cp -a /rootfs-$(uname -m)/* . &&\
    # Install Arch Linux ARM keyring if available
    (pacman -r . -S --noconfirm archlinuxarm-keyring || true) &&\
    # cleanup FS
    rm -Rf tmp/* \
      etc/machine-id etc/hostname \
      etc/ca-certificates/extracted/* /etc/ssl/certs/java/cacerts \
      etc/pacman.d/gnupg/{openpgp-revocs.d/,private-keys-v1.d/,pubring.gpg~,gnupg.S.*} \
      var/cache/pacman/pkg/* var/lib/pacman/sync/*

FROM scratch
ARG TAG=0.0.0

COPY --from=builder /archlinux /
ADD rootfs /

RUN pacman-key --init && pacman-key --populate archlinux && (pacman-key --populate archlinuxarm || true) &&\
    ln -fs /usr/lib/os-release etc/os-release &&\
    echo "VERSION_ID=$TAG" >> /etc/os-release &&\
    update-ca-trust &&\
    locale-gen &&\
    /usr/bin/systemd-sysusers --root / &&\
    sed -i -e 's/^root::/root:!:/' /etc/shadow

ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

