FROM mailu/roundcube:1.9.46

# renovate: datasource=github-tags depName=r3c/custom_from
ENV CUSTOM_FROM_VERSION=1.6.7
# renovate: datasource=github-tags depName=stremlau/html5_notifier
ENV HTLM5_NOTIFIER_VERSION=v0.6.4
# renovate: datasource=github-tags depName=mike-kfed/roundcube-thunderbird_labels
ENV THUNDERBIRD_LABELS_VERSION=v1.6.1
# renovate: datasource=github-tags depName=johndoh/roundcube-contextmenu
ENV CONTEXTMENU_VERSION=3.3.1
# renovate: datasource=github-tags depName=prodrigestivill/roundcube-gravatar
ENV GRAVATAR_VERSION=v1.6

RUN apt-get update &&\
    apt-get install -y git &&\
    apt-get clean &&\
    cd plugins &&\
    git clone https://github.com/r3c/custom_from.git custom_from && git -C custom_from checkout ${CUSTOM_FROM_VERSION} &&\
    git clone https://github.com/stremlau/html5_notifier.git html5_notifier && git -C html5_notifier checkout ${HTLM5_NOTIFIER_VERSION} &&\
    git clone https://github.com/mike-kfed/roundcube-thunderbird_labels.git thunderbird_labels && git -C thunderbird_labels checkout ${THUNDERBIRD_LABELS_VERSION} &&\
    git clone https://github.com/johndoh/roundcube-contextmenu.git contextmenu && git -C contextmenu checkout ${CONTEXTMENU_VERSION} &&\
    git clone https://github.com/prodrigestivill/roundcube-gravatar.git gravatar && git -C gravatar checkout ${GRAVATAR_VERSION}