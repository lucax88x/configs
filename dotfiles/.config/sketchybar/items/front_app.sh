#!/usr/bin/env sh

sketchybar --add       event        window_focus                  \
           --add       event        windows_on_spaces             \
           --add       item         system.yabai left             \
           --set       system.yabai script="$PLUGIN_DIR/yabai.sh" \
                                    icon.font="$FONT:Bold:16.0"   \
                                    label.drawing=off             \
                                    icon.width=30                 \
                                    icon=$YABAI_GRID              \
                                    icon.color=$GREEN             \
                                    updates=on                    \
                                    associated_display=active     \
           --subscribe system.yabai window_focus                  \
                                    windows_on_spaces             \
                                    mouse.clicked                 \
                                                                  \
           --add       item         front_app left                \
           --set       front_app    mach_helper="$HELPER"         \
                                    icon.drawing=off              \
                                    background.padding_left=0     \
                                    background.padding_right=10   \
                                    label.color=$WHITE            \
                                    label.font="$FONT:Black:12.0" \
                                    associated_display=active     \
           --subscribe front_app    front_app_switched

