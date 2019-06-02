#!/bin/sh

set -e

/usr/bin/pg_md5 -m -f /etc/pgpool.conf -u ${PG_USERNAME} ${PG_PASSWORD}

exec "$@"
