#!/bin/bash


#       Install Java
echo -e "\n\n\tInstall Java\n"
sudo apt install -y openjdk-8-jdk
sudo sh -c "echo 'JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\"' >> /etc/environment"
sudo sh -c "echo 'JAVA_JRE=\"/usr/lib/jvm/java-8-openjdk-amd64/jre\"' >> /etc/environment"

source /etc/environment
