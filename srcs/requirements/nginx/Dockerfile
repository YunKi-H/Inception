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

COPY		./conf/nginx.conf /etc/nginx/http.d/default.conf

COPY		./conf/index.html /var/www/html/index.html

RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

EXPOSE		443

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["nginx", "-g", "daemon off;"]
