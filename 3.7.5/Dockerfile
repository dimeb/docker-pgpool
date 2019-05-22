FROM dimeb/docker-alpine:3.8

ENV PGPOOL_VERSION 3.7.5-r0

RUN apk add --no-cache pgpool \
    && mkdir -p /var/run/pgpool/ /pgpoolII

ENV PG_USERNAME postgres
ENV PG_PASSWORD postgres

VOLUME /pgpoolII

# Listen port
EXPOSE 9999
# PCP port
EXPOSE 9898

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["pgpool", "-n", "-f", "/pgpoolII/pgpool.conf", "-F", "/pgpoolII/pcp.conf", "-a", "/pgpoolII/pool_hba.conf"]


