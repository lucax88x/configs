#!/bin/bash

sketchybar --add item battery right \
	icon.font="$FONT:$ICON_COLOR:12.0" \
	icon.color="$WHITE" \
  width=500 \
	--set battery icon="$BATTERY_CHARGING" \
	label.color="$WHITE" \
	label.padding_left=5 \
	label.padding_right=5 \
	align=center \
	script="$PLUGIN_DIR/battery.sh" \
	--set battery update_freq=10 \
	--subscribe battery system_woke
