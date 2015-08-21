FROM centos:7

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System
RUN yum install -y epel-release; yum clean all
RUN yum update  -y; yum clean all
RUN yum install -y hostname; yum clean all
RUN yum install -y openssl; yum clean all

# MySQL
RUN yum install -y mariadb-server; yum clean all
RUN mysql_install_db --user=root --ldata=/var/lib/mysql/

ENTRYPOINT /usr/bin/mysqld_safe --user=root
