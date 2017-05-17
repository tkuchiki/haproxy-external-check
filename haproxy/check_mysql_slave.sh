#!/bin/bash

maintenance=$(curl -s "http://consul:8500/v1/kv/db_maintenance/${HAPROXY_SERVER_NAME}?raw")

[ "${maintenance}" = "maintenance" ] && exit 1
exit 0
