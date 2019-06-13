#!/bin/sh

set -e

if [ ! -f /pgpoolII/config/pcp.conf ]; then
  cp /etc/pcp.conf.sample /pgpoolII/config/pcp.conf
fi
if [ ! -f /pgpoolII/config/pool_hba.conf ]; then
  cp /etc/pool_hba.conf.sample /pgpoolII/config/pool_hba.conf
fi
if [ ! -f /pgpoolII/config/pgpool.conf ]; then
  cp /etc/pgpool.conf.sample /pgpoolII/config/pgpool.conf
fi

fname=/pgpoolII/config/pcp.conf
f=`cat $fname`
cat < dev/null > $fname
for l in $f; do
  if [ "$PG_USERNAME" != "`echo -n $l | cut -c1-${#PG_USERNAME}`" ]; then
    echo $l > $fname
  fi
done
echo "$PG_USERNAME:`/usr/bin/pg_md5 $PG_PASSWORD`" > $fname

/usr/bin/pg_md5 -m -f /pgpoolII/config/pgpool.conf -u $PG_USERNAME $PG_PASSWORD

exec "$@" > /pgpoolII/logs/pgpool.log 2>&1
