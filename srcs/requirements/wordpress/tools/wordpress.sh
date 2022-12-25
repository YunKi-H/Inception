#sleep for mysql starting
sleep 5

#download wp-cli (wordpress command line interface)
curl	-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod	+x wp-cli.phar
mv		-f wp-cli.phar /usr/local/bin/wp

ln -s /usr/bin/php81 /usr/bin/php

/usr/local/bin/wp	core download --allow-root --path=/var/www/html

# move config file
mv					./wp-config.php /var/www/html/wp-config.php

# WordPress install
# https://developer.wordpress.org/cli/commands/core/install/
#   - url : the address of the new site
#   - title : the title of the new site
#   - admin_user : the name of the admin user
#   - admin_password : the password for the admin user (default to randomly generated string)
#   - admin_email : the email address for the admin user
#   - skip-email : don't send an email notification to the new admin user
#   - path : path to the wordpress files
/usr/local/bin/wp	core install \
					--allow-root \
					--path=/var/www/html \
					--url=${DOMAIN_NAME} \
					--title=Inception \
					--admin_user=${MYSQL_USER} \
					--admin_password=${MYSQL_USER_PASSWORD} \
					--admin_email=${MYSQL_USER}@student.42seoul.kr \
					--skip-email

# WordPress User Create
# https://developer.wordpress.org/cli/commands/user/create/
# usage: wp user create <user> <user-email> --option
#   - role : The role of the user to create. (Default: default role)
#            values can be ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’
#   - user_pass : The user password. (Default: randomly generated)
/usr/local/bin/wp	user create \
					--allow-root \
					--path=/var/www/html \
					${MYSQL_USER} \
					${MYSQL_USER}@student.42seoul.kr \
					--role=author \
					--user_pass=${MYSQL_USER_PASSWORD}

# no subshell is created and the current process is replaced
sleep 5
exec	php-fpm81 -F
