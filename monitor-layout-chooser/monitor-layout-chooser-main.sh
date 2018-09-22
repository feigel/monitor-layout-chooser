#!/bin/bash

while :; do
cd /userhome/.config/autorandr
layout=(*)
mylayout=$(zenity --list \
--title="Monitor Layout Manager" \
--height=250 \
--width=325 \
--cancel-label="Quit" \
--text="Choose function" \
--radiolist \
--column "Pick" \
--column "Answer" \
--column "value" \
--hide-column=3 \
--print-column=3 \
TRUE  "Load layout" "LOAD" \
FALSE "Create layout" "CREA" \
FALSE "Save layout" "SAVE" \
FALSE "Show available layouts" "SHOW" \
FALSE "Delete layout" "DELE" )
echo $mylayout

case $mylayout in
LOAD)	source /custom/monitor-layout-chooser/load-monitor-layout.sh
	;;
CREA)	source /custom/monitor-layout-chooser/create-monitor-layout.sh
	;;
SAVE)	source /custom/monitor-layout-chooser/save-monitor-layout.sh
	;;
SHOW)	source /custom/monitor-layout-chooser/show-monitor-layout.sh
	;;
DELE)	source /custom/monitor-layout-chooser/delete-monitor-layout.sh
	;;
*) exit 0
   ;;
esac
done
