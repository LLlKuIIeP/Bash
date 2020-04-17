#!/bin/bash

echo -e "\n\n\tinstall lamp\n"
sudo apt install tasksel -y
sudo tasksel install lamp-server

echo -e "\n\n\tinstall phpmyadmin\n"
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install phpmyadmin -y


#	https://qna.habr.com/q/535222
#	https://stackoverflow.com/questions/49948350/phpmyadmin-on-mysql-8-0/49950165

echo -e "\n\n\tset password for root\n"
cd ~/
touch create_user.sql
echo -e "CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY '1111';\n" > create_user.sql
echo -e "GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';\n" >> create_user.sql
echo -e "FLUSH PRIVILEGES;" >> create_user.sql
sudo mysql < create_user.sql
exit
rm -f create_user.sql

