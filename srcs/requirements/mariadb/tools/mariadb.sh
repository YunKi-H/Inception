mkdir -p /auth_pam_tool_dir/auth_pam_tool

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# cat > /tmp/mysql_init << EOF
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;
# CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
# GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MYSQL_USER'@'%';
# FLUSH PRIVILEGES;
# EOF

/usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';

CREATE DATABASE $WORDPRESS_DB;
CREATE USER '$WORDPRESS_USER'@'%' IDENTIFIED by '$WORDPRESS_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB.* TO '$WORDPRESS_USER'@'%';

FLUSH PRIVILEGES;
EOF

cp /tmp/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
