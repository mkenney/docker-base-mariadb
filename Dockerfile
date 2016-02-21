FROM mariadb:latest

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# This should be vol-mounted in your docker-compose file
RUN rm -rf /var/lib/mysql/*

RUN apt-get -q -y update

# Configure MariaDb
COPY container/etc/mysql/my.cnf /etc/mysql/my.cnf
COPY container/etc/mysql/conf.d/mariadb.cnf /etc/mysql/conf.d/mariadb.cnf

# Configure terminal access
COPY container/root/ /root/

RUN mkdir -p /var/log/mysql/ \
    && ln -s /dev/stderr /var/log/mysql/mariadb-slow.log

# Run
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]
