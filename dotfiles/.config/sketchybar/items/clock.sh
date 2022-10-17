#!/bin/bash
#
# sketchybar --add item clock right \
# 	--set clock update_freq=10 \
# 	icon.font="$FONT:Black:16.0" \
# 	script="$PLUGIN_DIR/clock.sh"
#
sketchybar --add item clock right \
	--set clock icon= \
	icon.color="$BLACK" \
	icon.font="$FONT:Black:12.0" \
	label.color="$BLACK" \
	label.padding_left=5 \
	label.padding_right=5 \
	align=center \
	script="$PLUGIN_DIR/clock.sh" \
	background.color="$CLOCK_BACKGROUND" \
	background.height=26 \
	background.corner_radius=11
