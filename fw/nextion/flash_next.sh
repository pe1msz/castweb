#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

sudo mount -o remount,rw /

# firmware received in zip-format, unzip and continue
UPLOADED=./nextion/*.zip
for zipped in $UPLOADED
do
       sudo unzip -o ${zipped} -d ./nextion
done


FIRMWARE=./nextion/*.tft
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # Firmware found, uploading with python-script.
  # pythonupload has been modified!!
  python ./nextion/nextionupload.py /dev/ttyAMA0 NX3224T024 ${found}

  # move to backup folder, and reboot
  sudo mv ./nextion/*.tft ./nextion/backup
  sudo mv ./nextion/*.zip ./nextion/backup
  # to make it work, reset mainboard, and reboot afterwards.
  sudo /usr/bin/cast-reset
  # sudo reboot
done
