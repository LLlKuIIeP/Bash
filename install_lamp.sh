#!/bin/bash

sudo apt-get update

#	Apache MySql PHP
echo -e "\n\n\tinstall lamp\n"
sudo apt install tasksel -y
sudo tasksel install lamp-server

echo -e "\n\n\tinstall modules for php\n"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php-bcmath php-curl php-db php-mbstring php-mysql php-bz2 php-xml

echo -e "\n\n\tinstall phpmyadmin\n"
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install phpmyadmin -y

# https://qna.habr.com/q/535222
# https://stackoverflow.com/questions/49948350/phpmyadmin-on-mysql-8-0/49950165
echo -e "\n\n\tset password for user\n"
cd ~/
touch create_user.sql
echo -e "CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY '1111';\n" > create_user.sql
echo -e "GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';\n" >> create_user.sql
echo -e "FLUSH PRIVILEGES;" >> create_user.sql
sudo mysql < create_user.sql
exit
rm -f create_user.sql
#************************************************


#       Composer
echo -e "\n\n\tinstall Composer\n"
sudo update
sudo apt-get install -y wget php-cli php-zip unzip curl
cd ~/
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer -v
#************************************************

#       NPM
echo -e "\n\n\tinstall NPM\n"
sudo curl https://www.npmjs.com/install.sh | sudo sh

sudo npm install -g node-pre-gyp
sudo ng init
sudo npm i
sudo npm audit fix
#************************************************
