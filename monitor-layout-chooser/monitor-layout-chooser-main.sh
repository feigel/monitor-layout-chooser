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
echo $mylayout

case $mylayout in
LOAD)	load-monitor-layout
	;;
CREA)	source /${CUSTOMDIR}/${PROGRAMDIR}/create-monitor-layout.sh
	;;
SAVE)	source /${CUSTOMDIR}/${PROGRAMDIR}/save-monitor-layout.sh
	;;
SHOW)	source /${CUSTOMDIR}/${PROGRAMDIR}/show-monitor-layout.sh
	;;
DELE)	source /${CUSTOMDIR}/${PROGRAMDIR}/delete-monitor-layout.sh
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
main

