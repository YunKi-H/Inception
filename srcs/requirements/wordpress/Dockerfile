FROM		alpine:3.16

RUN			apk update && apk upgrade
RUN			apk add mariadb-client bash curl wget

RUN			mkdir -p /var/www/html
RUN			mkdir -p /tmp

# php
RUN			apk add --no-cache \
			php81 \
			php81-fpm \
			php81-opcache \
			php81-pecl-apcu \
			php81-mysqli \
			php81-pgsql \
			php81-json \
			php81-openssl \
			php81-curl \
			php81-zlib \
			php81-soap \
			php81-xml \
			php81-fileinfo \
			php81-phar \
			php81-intl \
			php81-dom \
			php81-xmlreader \
			php81-ctype \
			php81-session \
			php81-iconv \
			php81-tokenizer \
			php81-zip \
			php81-simplexml \
			php81-mbstring \
			php81-gd \
			runit

COPY		./conf/wordpress.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY		./tools/wordpress.sh /tmp/wordpress.sh
RUN			chmod +x /tmp/wordpress.sh

RUN			chmod 777 -R /var/www/html

RUN			adduser -u 82 -D -S -G www-data www-data
RUN			chown -R www-data:www-data /var/www/html

COPY		./conf/wp-config.php ./

RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

EXPOSE		9000

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]
