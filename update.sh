#!/bin/sh
sudo mount -o remount,rw /
sudo git clone https://github.com/pe1msz/castbin /usr/bin/castbin
sudo rm /usr/bin/cast-avrdude
sudo rm /usr/bin/cast-reset
sudo rm /usr/bin/cast-fan
sudo mv /usr/bin/castbin/* /usr/bin/. 
sudo rm -r /usr/bin/castbin
sudo chmod +x /usr/bin/cast-avrdude
sudo chmod +x /usr/bin/cast-reset
sudo chmod +x /usr/bin/cast-fan
sudo rm -r /var/www/dashboard/admin/fw
sudo git clone https://github.com/pe1msz/castweb /var/www/dashboard/admin/castweb
sudo mv /var/www/dashboard/admin/castweb/*  /var/www/dashboard/admin/
sudo rm -r /var/www/dashboard/admin/castweb
sudo chown -R www-data:www-data /var/www/dashboard/admin/fw
sudo chmod +x /var/www/dashboard/admin/fw/dvmega/flash_mega.sh
sudo chmod +x /var/www/dashboard/admin/fw/cast/flash_cast.sh
sudo chmod +x /var/www/dashboard/admin/fw/nextion/flash_next.sh
