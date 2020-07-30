#!/bin/bash


#       Install Java
echo -e "\n\n\tInstall Java\n"
sudo apt install -y openjdk-8-jdk
sudo echo "JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\""
sudo echo "JAVA_JRE=\"/usr/lib/jvm/java-8-openjdk-amd64/jre\""
