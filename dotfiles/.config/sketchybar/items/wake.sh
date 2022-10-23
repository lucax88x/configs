#!/bin/bash

sketchybar --add event lock "com.apple.screenIsLocked" \
	--add event unlock "com.apple.screenIsUnlocked" \
	--add item animator left \
	--set animator drawing=off \
	updates=on \
	script="$PLUGIN_DIR/wake.sh" \
	--subscribe animator lock unlock
