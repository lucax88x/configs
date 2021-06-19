#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar laptop & \
  polybar left-home & polybar center-home & polybar right-home 
  # polybar left-work & polybar center-work & polybar right-work
  # polybar left-home &  polybar center-home & polybar right-home
