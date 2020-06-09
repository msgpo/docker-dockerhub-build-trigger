FROM alpine:latest

RUN apk --no-cache add curl bash

RUN mkdir -p /var/log/cron \
    && touch /var/log/cron/cron.log \
    && mkdir -m 0644 -p /etc/cron.d

ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
