mkdir -p /auth_pam_tool_dir/auth_pam_tool

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';

DELETE FROM mysql.user WHERE User='';
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD("$MARIADB_ROOT_PASSWORD");

CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB;
CREATE USER IF NOT EXISTS '$WORDPRESS_USER'@'%' IDENTIFIED by '$WORDPRESS_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB.* TO '$WORDPRESS_USER'@'%';

FLUSH PRIVILEGES;
EOF


cp /tmp/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
