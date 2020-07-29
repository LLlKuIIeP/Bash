#!/bin/bash


#       Install Boost
sudo apt install -y xclip xsel
sudo echo "alias pbcopy='xclip -selection clipboard'" >> ~/.bashrc
sudo echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.bashrc
source ~/.bashrc
