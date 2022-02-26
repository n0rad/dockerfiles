FROM n0rad/alpine-gitserver AS custom_from

RUN git clone https://github.com/r3c/custom_from.git && cd custom_from && git checkout 1.6.6
RUN git clone https://github.com/stremlau/html5_notifier.git && cd html5_notifier && git checkout v0.6.4



FROM mailu/roundcube
COPY --from=custom_from /custom_from /var/www/html/plugins/custom_from
RUN sed -i -r "s/(.*'plugins'.*)/\1 'custom_from', 'html5_notifier',/g" /var/www/html/config/config.inc.php
