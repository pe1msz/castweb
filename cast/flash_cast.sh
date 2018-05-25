#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

sudo mount -o remount,rw /
FIRMWARE=./cast/*.bin
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on each file. $f store current file name
  sudo stm32flash -v -w ${found} /dev/ttyAMA0 -R -i -67,67:-67,67

  # Output some advice
  mv ${found} nextion/backup
  sudo reboot
done
