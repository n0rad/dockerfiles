FROM alpine:3.19.0

RUN apk add git bash mdadm moreutils smartmontools python3 pacman && rm -rf /var/cache/apk/*

ENV TEXTFILE_COLLECTOR_VERSION=e6ab839098d87332af7ea7980bb1fe8fd439e58d

RUN git clone https://github.com/prometheus-community/node-exporter-textfile-collector-scripts.git node-exporters &&\
    cd node-exporters && git checkout ${TEXTFILE_COLLECTOR_VERSION}

RUN mkdir -p /var/run/node-exporter-textfile

RUN echo '*/5 * * * * /node-exporters/md_info.sh | sponge /var/run/node-exporter-textfile/md_info.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/smartmon.sh | sponge /var/run/node-exporter-textfile/smartmon.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/md_info_detail.sh | sponge /var/run/node-exporter-textfile/md_info_detail.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/pacman.sh | sponge /var/run/node-exporter-textfile/pacman.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/deleted_libraries.py | sponge /var/run/node-exporter-textfile/deleted_libraries.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/inotify-instances | sponge /var/run/node-exporter-textfile/inotify-instances.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/lvm-prom-collector -g | sponge /var/run/node-exporter-textfile/lvm-prom-collector-groups.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/lvm-prom-collector -p | sponge /var/run/node-exporter-textfile/lvm-prom-collector-physical.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/lvm-prom-collector -s | sponge /var/run/node-exporter-textfile/lvm-prom-collector-snapshots.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/lvm-prom-collector -t | sponge /var/run/node-exporter-textfile/lvm-prom-collector-thinpool.prom' >> /var/spool/cron/crontabs/root 
RUN echo '*/5 * * * * /node-exporters/btrfs_stats.py -t | sponge /var/run/node-exporter-textfile/btrfs_stats.prom' >> /var/spool/cron/crontabs/root 

CMD [ "/usr/sbin/crond", "-f", "-l", "0"]
