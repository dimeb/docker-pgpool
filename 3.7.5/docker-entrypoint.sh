#!/bin/sh

set -e

/usr/bin/pg_md5 -m -f /pgpoolII/config/pgpool.conf -u ${PG_USERNAME} ${PG_PASSWORD}

exec "$@"
