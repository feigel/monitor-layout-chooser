#!/bin/bash
cd /userhome/.config/autorandr
layout=(*/)
printf '%s\n' "${layout[@]%%/}" | zenity --text-info --width 350 --height $(( 70 * ${#layout[@]} )) --title="Available Layouts"
