#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php7/etc/conf.d

# Symlink php-fpm to php7-fpm
ln -s /usr/local/php7/bin/php /usr/bin/php
ln -s /usr/local/php7/bin/phpsize /usr/bin/phpsize
chmod 755 /usr/bin/debian
chmod 755 /usr/bin/scheduler
chmod 755 /usr/bin/usercontrol
chmod 755 /usr/bin/services
chmod 755 /usr/bin/lpbchecker


# Add config files
cp php-src/php.ini-production /usr/local/php7/lib/php.ini
cp conf/www.conf /usr/local/php7/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php7/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php7/etc/conf.d/modules.ini

# Add the init script
cp conf/php7-fpm.init /etc/init.d/php7-fpm
chmod +x /etc/init.d/php7-fpm
update-rc.d php7-fpm defaults

service php7-fpm start
