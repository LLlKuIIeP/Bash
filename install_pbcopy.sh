#!/bin/bash


#       Install Boost
sudo apt install -y xclip xsel
echo "alias pbcopy='xclip -selection clipboard'" > ~/.bashrc
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.bashrc
source ~/.bashrc
