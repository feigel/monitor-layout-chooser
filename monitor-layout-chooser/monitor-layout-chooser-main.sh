#!/bin/bash

CUSTOMDIR="custom"
PROGRAMDIR="monitor-layout-chooser"

main () {
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
FALSE "Delete all layouts" "DELA" )
echo $mylayout

case $mylayout in
LOAD)	load-monitor-layout
;;
CREA)	create-monitor-layout
	;;
SAVE)	save-monitor-layout
	;;
SHOW)	show-monitor-layout
	;;
DELE)	delete-monitor-layout
	;;
DELA)	delete-all-layouts
	;;
*) exit 0
   ;;
esac
done
}

load-monitor-layout () {
cd /userhome/.config/autorandr
layout=(*/)
mylayout=$(zenity --list --height $(( 70 * ${#layout[@]} )) --title="Choose layout" --column="Layout"  "${layout[@]%%/}")
/${CUSTOMDIR}/${PROGRAMDIR}/autorandr.py --force --load "${mylayout}" --skip-options primary
}

create-monitor-layout () {
touch /tmp/SAVE_MONITOR_LAYOUT_PENDING
cd /userhome/.config/autorandr
layout=(*)
xfce4-display-settings
mylayout=$(zenity --entry --text="Save Monitor Layout" --entry-text="Layout Name")
/${CUSTOMDIR}/${PROGRAMDIR}/autorandr.py --save "${mylayout}"
rm /tmp/SAVE_MONITOR_LAYOUT_PENDING
}

save-monitor-layout () {
touch /tmp/SAVE_MONITOR_LAYOUT_PENDING
mylayout=$(zenity --entry --text="Save Monitor Layout" --entry-text="Layout Name")
/${CUSTOMDIR}/${PROGRAMDIR}/autorandr.py --save "${mylayout}"
rm /tmp/SAVE_MONITOR_LAYOUT_PENDING
}

show-monitor-layout () {
cd /userhome/.config/autorandr
layout=(*/)
printf '%s\n' "${layout[@]%%/}" | zenity --text-info --width 350 --height $(( 70 * ${#layout[@]} )) --title="Available Layouts"
}

delete-monitor-layout () {
cd /userhome/.config/autorandr
layout=(*/)
mylayout=$(zenity --list --height $(( 70 * ${#layout[@]} )) --title="Delete layout" --column="Layout"  "${layout[@]%%/}")
/${CUSTOMDIR}/${PROGRAMDIR}/autorandr.py --remove "${mylayout}"
}

delete-all-layouts () {
rm -rf /userhome/.config/autorandr/*
}

main

