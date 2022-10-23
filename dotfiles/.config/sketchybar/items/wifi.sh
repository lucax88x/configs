#!/bin/bash

sketchybar --add item wifi right \
	--set wifi script="$PLUGIN_DIR/wifi.sh" \
	background.padding_right=12 \
	update_freq=5
