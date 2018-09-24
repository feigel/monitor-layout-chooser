#!/bin/bash
mkdir -p /custom/monitor-layout-chooser/autorandr-config
chown user:users /custom/monitor-layout-chooser/autorandr-config
ln -sf /custom/monitor-layout-chooser/autorandr-config /userhome/.config/autorandr
