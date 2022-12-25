FROM		alpine:3.16

RUN			apk update && apk upgrade
RUN			apk add bash curl wget

RUN			mkdir -p /var/www/html
RUN			mkdir -p /tmp

# php
RUN			apk add \
			php81 \
			php81-fpm \
			php81-mysqli \
			php81-opcache \
			php81-gd \
			php81-zlib \
			php81-curl \
			php81-bcmath \
			php81-ctype \
			php81-iconv \
			php81-intl \
			php81-json \
			php81-mbstring \
			php81-mysqlnd \
			php81-openssl \
			php81-pdo \
			php81-pdo_mysql \
			php81-pdo_pgsql \
			php81-pdo_sqlite \
			php81-phar \
			php81-posix \
			php81-session \
			php81-soap \
			php81-xml \
			php81-zip \
			libmcrypt-dev \
			libltdl \
			lighttpd

COPY		./conf/wordpress.conf /etc/php/8.1/fpm/pool.d/www.conf
COPY		./tools/wordpress.sh /tmp/wordpress.sh
RUN			chmod +x /tmp/wordpress.sh

RUN			chmod 777 -R /var/www/html

RUN			adduser -u 82 -D -S -G www-data www-data
RUN			chown -R www-data:www-data /var/www/html

COPY		./conf/wp-config.php ./

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

EXPOSE		9000

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]
