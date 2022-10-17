#!/bin/sh

if [ "$1" = "on" ]; then
	sketchybar \
		--set apple.logo drawing=off \
		--set '/cpu.*/' drawing=off \
		--set system.yabai drawing=off \
		--set separator drawing=off \
		--set front_app drawing=off
else
	sketchybar \
		--set apple.logo drawing=on \
		--set '/cpu.*/' drawing=on \
		--set system.yabai drawing=on \
		--set front_app drawing=on \
		--set separator drawing=on
fi
