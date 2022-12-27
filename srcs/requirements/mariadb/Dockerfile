FROM		alpine:3.16

RUN			apk update && apk upgrade

# install mariadb
RUN			apk add --no-cache mariadb
RUN			apk add --no-cache mariadb-common
RUN			apk add --no-cache mariadb-client
RUN			apk add --no-cache mariadb-server-utils

RUN			mkdir -p /run/mysqld
RUN			chown -R mysql:mysql /run/mysqld

RUN			mkdir -p /var/lib/mysql
RUN			chown -R mysql:mysql /var/lib/mysql

# move setting files
COPY		./conf/mariadb.conf /tmp/mariadb-server.cnf
COPY		./tools/mariadb.sh /tmp/mariadb.sh
RUN			chmod 777 /tmp/mariadb.sh

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/mariadb.sh"]

EXPOSE		3306
