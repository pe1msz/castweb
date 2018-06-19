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
  # take action on this file, upload it to mainboard.
  sudo stm32flash -v -w ${found} /dev/ttyAMA0 -R -i -67,67:-67,67

  # Make a backup of the uploaded FW to backup-folder, and reboot afterwards.
  mv ${found} cast/backup
  sudo reboot
done
