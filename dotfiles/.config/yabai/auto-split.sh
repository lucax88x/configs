#!/usr/bin/env bash

yabai -m query --windows --window $YABAI_WINDOW_ID | jq -re '.split == "horizontal"' && yabai -m window $YABAI_WINDOW_ID --toggle split
