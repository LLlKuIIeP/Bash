#!/bin/bash


#       Install Ansible
echo -e "\n\n\tInstall Ansible\n"

apt update
apt install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible
