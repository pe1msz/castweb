#!/bin/sh

sudo mount -o remount,rw /

cd /var/www/dashboard/admin/fw

sudo wget https://www.combitronics.nl/download/index.phph
sudo mv index.phph index.php
cd ..
sudo wget https://www.combitronics.nl/download/cast_update_pages.phph
sudo mv cast_update_pages.phph cast_update_pages.php
sudo wget https://www.combitronics.nl/download/cast_update.sh
sudo chmod +x /var/www/dashboard/admin/cast_update.sh

