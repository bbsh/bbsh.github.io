#!/bin/bash -e

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Web-server
sudo apt purge -y apache2
sudo apt install -y nginx
