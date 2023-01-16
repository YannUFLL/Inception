#!/bin/sh 
sed -i 's/0.0.0.0/localhost/'  /etc/mysql/mariadb.conf.d/50-server.cnf
# Strangely, work without root information but still throw a error message 
service mysql start 2>/dev/null
until mysqladmin -u root -p$MARIADB_ROOT_PASSWORD ping 2>/dev/null
do
	sleep 2
done
sleep 2
echo "MySQL service is running."
if ! mariadb -u root -p$MARIADB_ROOT_PASSWORD -e "USE $MARIADB_DATABASE" >/dev/null 2>&1; then
	echo "Database doesn't existe, creating a new database..."
	mariadb -e "CREATE DATABASE $MARIADB_DATABASE"
	mariadb -e "CREATE USER $MARIADB_USER IDENTIFIED BY '$MARIADB_USER_PASSWORD'"
	mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER"
	mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'" 
	echo "Database created."
fi;
sleep 5
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
# We need to shutdown the server after the configuration because we are going to exec the server and no use it with a background process
while mysqladmin -u root -p$MARIADB_ROOT_PASSWORD ping 2>/dev/null
do
	sleep 2
done
# We need to be sure that the mysql server is well stopped, so we wait again a little bit
sleep 2 
sed -i 's/localhost/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
exec mysqld