#!/bin/bash
echo "##############################################"
echo "#            One Time Setup                  #"
echo "##############################################"
echo "setup will take few minuts to hour depending upon network condition"
echo "Lets begin ..."
sleep 3

# sudo apt-get update
sudo apt-get install csync2 -y

# check if csync2 folder exists in OTS folder if not then generate
sudo openssl genrsa -out /etc/csync2_ssl_key.pem 1024
sudo openssl req -new -key /etc/csync2_ssl_key.pem -out /etc/csync2_ssl_cert.csr
sudo openssl x509 -req -days 600 -in /etc/csync2_ssl_cert.csr \
        -signkey /etc/csync2_ssl_key.pem -out /etc/csync2_ssl_cert.pem
sudo csync2 -k /etc/csync2.key

mkdir sigfiles
sudo cp /etc/csync2* ./sigfiles
#end of if

sudo apt-get install lsyncd -y
sudo apt-get install nmap -y
sudo mkdir /etc/lsyncd
sudo cp configs/lsyncd.conf.lua /etc/lsyncd/
sudo cp configs/csync2_common.cfg /etc/

