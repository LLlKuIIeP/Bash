#!/bin/bash

echo -e "\n\n\tinstall lamp\n"
sudo apt install tasksel
sudo tasksel install lamp-server

echo -e "\n\n\tinstall phpmyadmin\n"
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install phpmyadmin
