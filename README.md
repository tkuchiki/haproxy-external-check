# haproxy-external-check


## build

```console
$ docker-compose build
```

## run

```console
$ docker-compose up -d
```

## example

```console
# docker host
$ docker exec -it $(docker ps | grep _haproxy | awk '{print $1}') /bin/bash

# 
$ curl -X PUT -d "maintenance" http://consul:8500/v1/kv/db_maintenance/slave1
true

$ tail /var/log/haproxy.log
...
May 16 07:22:24 localhost haproxy[1]: Server b_mysql_slave/slave1 is DOWN, reason: External check error, code: 1, check duration: 14ms. 1 active and 0 backup servers left. 0 sessions active, 0 requeued, 0 remaining in queue.
May 16 07:22:24 localhost haproxy[1]: Server b_mysql_slave/slave1 is DOWN, reason: External check error, code: 1, check duration: 14ms. 1 active and 0 backup servers left. 0 sessions active, 0 requeued, 0 remaining in queue.
...

$ curl -X DELETE http://consul:8500/v1/kv/db_maintenance/slave1
true

$ tail /var/log/haproxy.log
...
May 16 07:24:20 localhost haproxy[1]: Server b_mysql_slave/slave1 is UP, reason: External check passed, code: 0, check duration: 17ms. 2 active and 0 backup servers online. 0 sessions requeued, 0 total in queue.
May 16 07:24:20 localhost haproxy[1]: Server b_mysql_slave/slave1 is UP, reason: External check passed, code: 0, check duration: 17ms. 2 active and 0 backup servers online. 0 sessions requeued, 0 total in queue.
...
```
