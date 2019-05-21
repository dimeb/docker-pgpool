#!/usr/bin/dumb-init /bin/sh

set -e

if [ ! -f /pgpoolII/pcp.conf ]; then
    cp /etc/pcp.conf.sample /pgpoolII/pcp.conf
fi
if [ ! -f /pgpoolII/pgpool.conf ]; then
    cp /etc/pgpool.conf.sample /pgpoolII/pgpool.conf
fi
if [ ! -f /pgpoolII/pool_hba.conf ]; then
    cp /etc/pool_hba.conf.sample /pgpoolII/pool_hba.conf
fi

/usr/bin/pg_md5 -m -f /pgpoolII/pgpool.conf -u $PG_USERNAME $PG_PASSWORD
# if [ "$1" = 'pgpool-server' ]; then
# 	exec pgpool "$@"
# fi

exec "$@"
