FROM mariadb:latest

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# This should be vol-mounted in your docker-compose file
RUN rm -rf /var/lib/mysql/*

RUN apt-get -q -y update

# Configure terminal access
COPY container/root/ /root/

# Run
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]
