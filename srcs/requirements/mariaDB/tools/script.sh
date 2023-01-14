#!/bin/sh 
sed -i 's/0.0.0.0/localhost/'  /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start
until mysqladmin ping 2>/dev/null
do
	sleep 2
done
echo "MySQL service is running!"
if ! mariadb -e "USE $MARIADB_DATABASE" >/dev/null 2>&1; then
	echo "Database doesn't existe, creating a new database..."
	mariadb -e "CREATE DATABASE $MARIADB_DATABASE"
	mariadb -e "CREATE USER $MARIADB_USER IDENTIFIED BY '$MARIADB_USER_PASSWORD'"
	mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER"
	mariadb -e "FLUSH PRIVILEGES"
	echo "Database created !"
fi;
sleep 2
service mysql stop
while mysqladmin ping 2>/dev/null
do
	sleep 2
done
sed -i 's/localhost/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec mysql