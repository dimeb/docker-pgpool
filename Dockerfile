FROM dimeb/docker-alpine:3.8

ENV PGPOOL_VERSION 3.7.9-r0

RUN apk add --no-cache pgpool && \
    mkdir -p /var/run/pgpool/ \
            /pgpoolII/config \
            /pgpoolII/data \
            /pgpoolII/logs

ENV PG_USERNAME postgres
ENV PG_PASSWORD postgres

# Listen port
EXPOSE 9999
# PCP port
EXPOSE 9898
# Heartbeat port
EXPOSE 9694
# Watchdog port
EXPOSE 9000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pgpool", "-n", "-f", "/pgpoolII/config/pgpool.conf", "-F", "/pgpoolII/config/pcp.conf", "-a", "/pgpoolII/config/pool_hba.conf"]


