#!/bin/sh
set -e

HAPROXY_CONFIG=${HAPROXY_CONFIG:-/etc/haproxy/haproxy.cfg}

exec /usr/sbin/haproxy -f ${HAPROXY_CONFIG}
