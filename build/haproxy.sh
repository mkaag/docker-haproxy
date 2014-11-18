#!/usr/bin/env bash
set -e

HAPROXY_CONFIG=${HAPROXY_CONFIG:-/etc/haproxy/haproxy.cfg}

/usr/sbin/haproxy -f ${HAPROXY_CONFIG}
