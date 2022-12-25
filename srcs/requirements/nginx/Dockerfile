FROM		alpine:3.16

RUN			apk update && apk upgrade
# nginx
RUN			apk add nginx
RUN			mkdir -p /var/www/html

# openssl
RUN			apk add openssl
RUN			mkdir -p /etc/nginx/ssl
RUN			openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
			-out /etc/nginx/ssl/yuhwang.crt \
			-keyout /etc/nginx/ssl/yuhwang.key \
			-subj "/C=KR/ST=Seoul/O=42Seoul/OU=yuhwang/CN=inception/"
RUN			chmod 777 /etc/nginx/ssl/yuhwang.crt /etc/nginx/ssl/yuhwang.key

# config
COPY		./conf/nginx.conf /etc/nginx/http.d/default.conf

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["nginx", "-g", "daemon off;"]

EXPOSE		443
