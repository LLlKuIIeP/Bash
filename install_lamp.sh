#!/bin/bash

echo -e "\n\n\tinstall lamp\n"
sudo apt install tasksel -y
sudo tasksel install lamp-server

echo -e "\n\n\tinstall phpmyadmin\n"
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install phpmyadmin -y

echo -e "\n\n\tset password for root\n"
cd ~/
touch alter_pass_root.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1111';" > alter_pass_root.sql
sudo mysql < alter_pass_root.sql
exit
rm -f alter_pass_root.sql

