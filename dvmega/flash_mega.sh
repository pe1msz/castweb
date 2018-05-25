#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

#sudo mount -o remount,rw /
FIRMWARE=./dvmega/*.hex
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on each file. $f store current file name
  /usr/bin/cast-avrdude -p m328p -c arduino -P /dev/ttyS2 -b 115200 -F -U flash:w:${found} -v 
 
  # Output some advice
  mv ${found} ./dvmega/backup
  sudo reboot
done
