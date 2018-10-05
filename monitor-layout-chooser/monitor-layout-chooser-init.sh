#!/bin/bash
mkdir -p /custom/monitor-layout-chooser/autorandr-config
chown user:users /custom/monitor-layout-chooser/autorandr-config
ln -sf /custom/monitor-layout-chooser/autorandr-config /userhome/.config/autorandr
cp /custom/monitor-layout-chooser/autorandr.py /usr/bin/autorandr
cp /custom/monitor-layout-chooser/autorandr.service /lib/systemd/system
systemctl enable autorandr.service ; \ 
systemctl start autorandr.service ; \ 
cp /custom/monitor-layout-chooser/40-monitor-hotplug.rules /lib/udev/rules.d ; \ 
udevadm control --reload &
