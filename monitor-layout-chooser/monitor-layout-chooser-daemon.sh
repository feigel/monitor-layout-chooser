while :; do 

if [ $(pidof xfce4-display-settings) ]; then
	while [ $(pidof xfce4-display-settings) ]; do
		sleep 3
		done
	if [ ! -f /tmp/SAVE_MONITOR_LAYOUT_PENDING ]; then
	source /custom/monitor-layout-chooser/save-monitor-layout.sh
	fi
fi

if [ ! -f /tmp/SAVE_MONITOR_LAYOUT_PENDING ]; then
TOPPROFILE="`/custom/monitor-layout-chooser/autorandr.py --detected | (mapfile -t layouts; echo ${layouts[0]})`"
/custom/monitor-layout-chooser/autorandr.py --force --load "${TOPPROFILE}"
/custom/monitor-layout-chooser/autorandr.py --force --change
fi

sleep 3
if [ -f /tmp/KILLYOURSELF ]; then
	rm /tmp/KILLYOURSELF
	exit 1;
fi
done
