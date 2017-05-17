FROM haproxy:1.7

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY check_mysql_slave.sh /usr/local/bin/check_mysql_slave.sh
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY haproxy.conf /etc/rsyslog.d/haproxy.conf

RUN apt-get update -y && apt-get install -y curl mysql-client rsyslog less vim
RUN sed -i 's/#$ModLoad imudp/$ModLoad imudp/g' /etc/rsyslog.conf
RUN sed -i 's/#$UDPServerRun 514/$UDPServerRun 514/g' /etc/rsyslog.conf

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
