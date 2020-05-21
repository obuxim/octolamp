#!/bin/bash
echo 'Allowing PORTS' &&
sudo ufw allow 80 &&
sudo ufw allow 443 &&
echo 'Installing HTTPS Transport' &&
sudo apt-get install apt-transport-https -y &&
echo 'Adding ondrej/php repository' &&
sudo add-apt-repository ppa:ondrej/php &&
echo 'Refreshing APT Repositories' &&
sudo apt-get update -y &&
echo 'Uninstalling PHP'
sudo apt-get purge -y php* &&
echo 'Installing PHP 7.4' &&
sudo apt-get install -y php7.4 php7.4-common php7.4-fpm php7.4-mysql php7.4-pgsql php7.4-mbstring php7.4-xml php7.4-zip php7.4-gd libapache2-mod-php7.4 &&
echo 'Configuring Apache' &&
sudo a2enmod php7.4 &&
echo 'Restarting Apache' &&
sudo systemctl reload apache2 &&
echo 'Installing MariaDB' &&
sudo apt-get install -y mariadb-server mariadb-client &&
echo 'Starting MariaDB Server' &&
sudo systemctl start mariadb &&
echo 'Adding Apache2 & MariaDB to startup' &&
sudo systemctl enable apache2 &&
sudo systemctl enable mariadb &&
echo 'Configuring MySQL' &&
sudo mysql_secure_installation &&
echo 'Installing phpMyAdmin' &&
sudo apt-get install -y phpmyadmin &&
echo 'Please configure a new User for phpMyAdmin and Login.' &&
echo '-----------------------------------------------------------' &&
echo 'Server is ready!'
