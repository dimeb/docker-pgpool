#!/bin/sh

set -e

echo "$PG_USERNAME:`/usr/bin/pg_md5 ${PG_PASSWORD}`" > /pgpoolII/config/pcp.conf
/usr/bin/pg_md5 -m -f /pgpoolII/config/pgpool.conf -u ${PG_USERNAME} ${PG_PASSWORD}

exec "$@"
