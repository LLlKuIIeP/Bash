#!/bin/bash

sudo apt-get update

#       Install NodeJs
#echo -e "\n\n\tInstall NodeJs\n"
#sudo apt-get update
#cd ~/
#VERSION=v12.16.2
#DISTRO=linux-x64
#wget https://nodejs.org/download/release/$VERSION/node-$VERSION-$DISTRO.tar.xz
#sudo mkdir -p /usr/local/lib/nodejs
#sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
#export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
#source .profile
#node -v
#npm  version
#npx -v

# -- скачать готовый докер образ
sudo docker pull kitware/cdash

# -- скачать репу
cd ~/
git clone https://github.com/Kitware/CDash.git

# -- изменить файл CDash/docker/.env.laravel
#APP_URL=http://cdash.cet-mipt.ru
#APP_TIMEZONE=Europe/Moscow
#...
#MAIL_DRIVER=smtp
#MAIL_HOST=smtp.smtpcloud.ru
#MAIL_PORT=587
#MAIL_USERNAME=cdash@cet-mipt.ru
#MAIL_PASSWORD=<password>
#MAIL_ENCRYPTION=tls

# -- изменить файл CDash/docker/docker-compose.mysql.yml 
#build:
#      context: .
#      dockerfile: ./docker/cdash.docker
#      args:
#        - CDASH_DB_HOST=mysql
#        - DEVELOPMENT_BUILD=1
#    depends_on:
#      - mysql
#      - selenium-hub
#      - chrome
#    links:
#      - mysql
#    ports:
#     - "80:80"
# ...
#mysql:
#    image: "mysql/mysql-server:5.7"
#    env_file:
#      - ./docker/.env.mysql
#    environment:
#      MYSQL_ALLOW_EMPTY_PASSWORD: 'yes'
#      MYSQL_ROOT_PASSWORD: ''
#      MYSQL_ROOT_HOST: '%'
#    ports:
#      - "3306:3306"

# -- тоже самое в файле docker-compose.production.yml

# -- инициализировать базу
sudo apt install -y mysql-client
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-0.0-0.8.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-0.8-1.0.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-1.0-1.2.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-1.2-1.4.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-1.4-1.6.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-1.6-1.8.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-1.8-2.0.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-2.0-2.6.sql
mysql -h 127.0.0.1 -P 3306 -u root -D cdash < CDash/app/cdash/sql/mysql/cdash-upgrade-3.0.sql

# -- установить mysql workbench
sudo apt install -y mysql-workbench-community

# -- убрать apparmor
sudo snap connect mysql-workbench-community:password-manager-service :password-manager-service

## -- запустить докеры
cd CDash
sudo docker-compose up -d
