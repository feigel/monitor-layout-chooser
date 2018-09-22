#!/bin/bash
cd /userhome/.config/autorandr
layout=(*/)
mylayout=$(zenity --list --height $(( 70 * ${#layout[@]} )) --title="Delete layout" --column="Layout"  "${layout[@]%%/}")
#source /userhome/.screenlayout/${mylayout}.sh
/custom/monitor-layout-chooser/autorandr.py --remove "${mylayout}"
