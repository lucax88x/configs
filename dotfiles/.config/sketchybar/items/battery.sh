#!/bin/bash

sketchybar --add item battery right \
	--set battery icon="$BATTERY_CHARGING" \
	icon.font="$ICON_FONT" \
	icon.color="$WHITE" \
	label.color="$WHITE" \
	label.padding_left=5 \
	label.padding_right=5 \
	align=center \
	script="$PLUGIN_DIR/battery.sh" \
	--set battery update_freq=10 \
	--subscribe battery system_woke
