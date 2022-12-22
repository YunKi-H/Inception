FROM		alpine:3.16

RUN			apk update && apk upgrade
RUN			apk add mariadb-client

RUN			mkdir -p /var/www/html

# COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY		./tools/wordpress.sh /tmp/wordpress.sh

RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

EXPOSE		9000

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]
