FROM n0rad/alpine-gitserver AS custom_from

RUN git clone https://github.com/r3c/custom_from.git && cd custom_from && git checkout 1.6.6
RUN git clone https://github.com/stremlau/html5_notifier.git && cd html5_notifier && git checkout v0.6.4
RUN git clone https://github.com/mike-kfed/roundcube-thunderbird_labels.git thunderbird_labels && cd thunderbird_labels && git checkout v1.4.10
RUN git clone https://github.com/johndoh/roundcube-contextmenu.git contextmenu && cd contextmenu && git checkout v0.9.5




FROM mailu/roundcube
COPY --from=custom_from /custom_from /var/www/html/plugins/custom_from
COPY --from=html5_notifier /custom_from /var/www/html/plugins/html5_notifier
COPY --from=thunderbird_labels /custom_from /var/www/html/plugins/thunderbird_labels
COPY --from=contextmenu /custom_from /var/www/html/plugins/contextmenu

RUN sed -i -r "s/(.*'plugins'.*)/\1 'custom_from', 'html5_notifier', 'thunderbird_labels', 'contextmenu'/g" /var/www/html/config/config.inc.php
