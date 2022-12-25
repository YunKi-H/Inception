FROM		alpine:3.16

RUN			apk update && apk upgrade

# mariadb
RUN			apk add mariadb
RUN			apk add mariadb-common
RUN			apk add mariadb-client
RUN			apk add mariadb-server-utils

COPY		./conf/mariadb.conf /etc/my.conf

RUN			mkdir -p /run/mysqld
RUN			mkdir -p /var/lib/mysql

RUN			chown -R mysql /var/lib/mysql
RUN			chmod 777 /var/lib/mysql

COPY		./tools/mariadb.sh /tmp/mariadb.sh
RUN			chmod 777 /tmp/mariadb.sh

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/mariadb.sh"]

EXPOSE		3306
