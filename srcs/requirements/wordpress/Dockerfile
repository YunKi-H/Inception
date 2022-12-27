FROM		alpine:3.16

RUN			apk update && apk upgrade

# install php
RUN			apk add --no-cache \
			mariadb-client \
			php8 \
			php8-fpm \
			php8-phar \
			php8-mysqli \
			php8-mysqlnd \
			php8-openssl \
			php8-json \
			php8-curl \
			php8-exif \
			php8-dom \
			php8-mbstring \
			php8-fileinfo \
			php8-xml \
			php8-zip

# install wp-cli
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/bin/wp

# move setting files
COPY		./conf/wordpress.conf /etc/php8/php-fpm.d/www.conf
COPY		./tools/wordpress.sh /tmp/wordpress.sh
RUN			chmod 777 /tmp/wordpress.sh

RUN			adduser -u 82 -D -S -G www-data www-data

COPY		./conf/wp-config.php /tmp/wp-config.php

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

WORKDIR		/var/www/html

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]

EXPOSE		9000
