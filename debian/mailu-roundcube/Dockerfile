FROM mailu/roundcube:1.9.10
RUN apt-get update &&\
    apt-get install -y git &&\
    apt-get clean &&\
    cd plugins &&\
    git clone https://github.com/r3c/custom_from.git custom_from && git -C custom_from checkout 1.6.6 &&\
    git clone https://github.com/stremlau/html5_notifier.git html5_notifier && git -C html5_notifier checkout v0.6.4 &&\
    git clone https://github.com/mike-kfed/roundcube-thunderbird_labels.git thunderbird_labels && git -C thunderbird_labels checkout v1.4.10 &&\
    git clone https://github.com/johndoh/roundcube-contextmenu.git contextmenu && git -C contextmenu checkout v0.9.5