#!/bin/bash
#
sketchybar --add item battery right \
	--set battery script="$PLUGIN_DIR/battery.sh" \
	icon.font="$FONT:Black:16.0" \
	update_freq=10 \
	--subscribe battery system_woke
