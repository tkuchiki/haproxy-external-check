#!/bin/sh

rm -f /var/run/rsyslogd.pid
service rsyslog start

exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
