#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

sudo mount -o remount,rw /

UPLOADED=./nextion/*.zip
for zipped in $UPLOADED
do
       sudo unzip -o ${zipped} -d ./nextion
done


FIRMWARE=./nextion/*.tft
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on each file. $f store current file name
  python ./nextion/nextionupload.py /dev/ttyAMA0 NX3224T024 ${found}

  # Output some advice
  mv ./nextion/*.tft ./nextion/backup
  mv ./nextion/*.zip ./nextion/backup
  sudo /usr/bin/myreset
  sudo reboot
done
