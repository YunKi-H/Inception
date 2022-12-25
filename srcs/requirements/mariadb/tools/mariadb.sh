mkdir -p /home/yuhwang/data/database
mkdir -p /home/yuhwang/data/www
mkdir -p /auth_pam_tool_dir/auth_pam_tool

# /usr/bin/mysql_install_db --user=${MYSQL_ROOT} \
# --basedir=/usr \
# --datadir=/var/lib/mysql

# /usr/bin/mysqld --user=${MYSQL_ROOT} --datadir=/var/lib/mysql
# sleep 2

# # wordpress 데이터베이스 생성
# mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
# # 계정 생성
# mysql -e "CREATE USER IF NOT EXISTS `$MYSQL_USER`@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
# # 데이터베이스 권한 부여
# mysql -e "GRANT ALL PRIVILEGES ON `$MARIADB_NAME`.* TO `$MYSQL_USER`@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
# # root에 비밀번호 생성
# mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# # 새로고침
# mysql -e "FLUSH PRIVILEGES;"


# # pkill mysqld
# mysqladmin -u${MYSQL_ROOT} -p${MYSQL_ROOT_PASSWORD} shutdown

# # 재실행
# /usr/bin/mysqld --user=${MYSQL_ROOT} --datadir=/var/lib/mysql


# mkdir -p /home/yotak/data/db
# mkdir -p /home/yotak/data/www
# apk del golang-docker-credential-helpers
# --user myslqd(mysql 서버)를 구동하기 위한 사용자 이름
# --basedir mysql설치 디렉토리 경로
# --datadir mysql데이터 디렉토리 경로
# https://pyrasis.com/book/DockerForTheReallyImpatient/Chapter16/02
/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

# CREATE랑 GRANT사이에 들어가면 폭발....-- FLUSH PRIVILEGES;
# GRANT ALL에서 IDENTIFIED BY $USER_PASSWORD
# cat > /tmp/mysql_init << EOF
# FLUSH PRIVILEGES;
# CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;
# CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
# GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MYSQL_USER'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

# /usr/bin/mysqld --user=root --bootstrap < /tmp/mysql_init
# rm -rf /tmp/sql
cp /etc/my.cnf /etc/my.cnf.d/mariadb-server.cnf

sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME";

mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD'";

mysql -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MYSQL_USER'@'%'";

mysql -e "ALTER USER root@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";

mysql -e "FLUSH PRIVILEGES";

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

/usr/bin/mysqld --user=root -p$MYSQL_ROOT_PASSWORD --datadir=/var/lib/mysql

# while true; do { sleep 1 }; done;
