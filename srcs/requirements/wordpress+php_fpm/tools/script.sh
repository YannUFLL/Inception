#!/bin/sh 
WORDPRESS_DIR="/var/www/html/wordpress"
until mysqladmin ping --user=${WORDPRESS_DB_USER}--password=${WORDPRESS_DB_PASSWORD} --host=mariadb 2>/dev/null
do 
	echo "Waiting for mariadb database availability..."
	sleep 2
done
if [ ! -f "$WORDPRESS_DIR/wp-config.php" ]; then
		echo "Wordpress is not install, installing..."
		mv /home/wp-config.php /var/www/html/wordpress 
		wp	--allow-root \
		--path=/var/www/html/wordpress/ core install \
		--url=ydumaine.42.fr \
		--title=$WORDPRESS_WEBSITE_TITLE \
		--admin_user=$WORDPRESS_ADMIN_USER \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=yannlescoul79@free.fr \
		--locale=FR \
		--skip-email 
fi;
	echo "Wordpress is fully configure and operational"
	exec /usr/sbin/php-fpm7.3