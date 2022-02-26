FROM n0rad/alpine-gitserver AS custom_from

RUN git clone https://github.com/r3c/custom_from.git && cd custom_from && git checkout 1.6.6



FROM mailu/roundcube
COPY --from=custom_from /custom_from /var/www/html/plugins/custom_from
RUN sed -i -r "s/(.*'plugins'.*)/\1 'custom_from',/g" /var/www/html/config/config.inc.php
