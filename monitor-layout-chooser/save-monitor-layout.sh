#!/bin/bash
touch /tmp/SAVE_MONITOR_LAYOUT_PENDING
mylayout=$(zenity --entry --text="Save Monitor Layout" --entry-text="Layout Name")
/custom/monitor-layout-chooser/autorandr.py --save "${mylayout}"
rm /tmp/SAVE_MONITOR_LAYOUT_PENDING
