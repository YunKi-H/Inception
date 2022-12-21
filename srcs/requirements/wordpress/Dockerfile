FROM		alpine:3.16

RUN			apk update && apk upgrade
RUN			apk add nginx openssl

RUN			mkdir -p /var/www/html
RUN			mkdir -p /etc/nginx/ssl
RUN			openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
			-out /etc/nginx/ssl/yuhwang.crt \
			-keyout /etc/nginx/ssl/yuhwang.key \
			-subj "/C=KR/ST=Seoul/O=42Seoul/OU=yuhwang/CN=inception/"

RUN			chmod 777 /etc/nginx/ssl/yuhwang.crt /etc/nginx/ssl/yuhwang.key

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY		./tools/wordpress.sh /tmp/wordpress.sh

RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

EXPOSE		9000

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]
