mv /tmp/wp-config.php /var/www/html/wp-config.php

wp core download --allow-root --path=/var/www/html
# WordPress install
# https://developer.wordpress.org/cli/commands/core/install/
#   - url : the address of the new site
#   - title : the title of the new site
#   - admin_user : the name of the admin user
#   - admin_password : the password for the admin user (default to randomly generated string)
#   - admin_email : the email address for the admin user
#   - skip-email : don't send an email notification to the new admin user
#   - path : path to the wordpress files
wp	core install \
	--allow-root \
	--path=/var/www/html \
	--url=${DOMAIN_NAME} \
	--title=Inception \
	--admin_user=${WORDPRESS_ADMIN} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN}@student.42seoul.kr \
	--skip-email

# WordPress User Create
# https://developer.wordpress.org/cli/commands/user/create/
# usage: wp user create <user> <user-email> --option
#   - role : The role of the user to create. (Default: default role)
#            values can be ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’
#   - user_pass : The user password. (Default: randomly generated)
wp	user create \
	--allow-root \
	--path=/var/www/html \
	${WORDPRESS_USER} \
	${WORDPRESS_USER}@student.42seoul.kr \
	--role=author \
	--user_pass=${WORDPRESS_USER_PASSWORD}

php-fpm8 -F -R
