#!/bin/bash
touch /tmp/SAVE_MONITOR_LAYOUT_PENDING
cd /userhome/.config/autorandr
layout=(*)
xfce4-display-settings
mylayout=$(zenity --entry --text="Save Monitor Layout" --entry-text="Layout Name")
#source /userhome/.screenlayout/${mylayout}.sh
/custom/monitor-layout-chooser/autorandr.py --save "${mylayout}"
rm /tmp/SAVE_MONITOR_LAYOUT_PENDING
