#!/usr/bin/env sh

sketchybar --add item        cpu.top right                  \
           --set cpu.top     label.font="$FONT:Semibold:7"  \
                             label=CPU                      \
                             icon.drawing=off               \
                             width=0                        \
                             y_offset=6                     \
                             background.padding_right=23    \
                                                            \
           --add item        cpu.percent right              \
           --set cpu.percent label.font="$FONT:Heavy:12"    \
                             label=CPU                      \
                             y_offset=-4                    \
                             width=40                       \
                             icon.drawing=off               \
                             update_freq=2                  \
                             mach_helper="$HELPER"          \
                             background.padding_right=20    \
                                                            \
           --add graph       cpu.sys right 100              \
           --set cpu.sys     width=0                        \
                             graph.color=$RED               \
                             graph.fill_color=$RED          \
                             label.drawing=off              \
                             icon.drawing=off               \
                             background.padding_right=20    \
                             background.padding_left=10     \
                             background.height=30           \
                             background.drawing=on          \
                             background.color=$TRANSPARENT  \
                                                            \
           --add graph       cpu.user right 100             \
           --set cpu.user    graph.color=$BLUE              \
                             label.drawing=off              \
                             icon.drawing=off               \
                             background.padding_right=20    \
                             background.padding_left=10     \
                             background.height=30           \
                             background.drawing=on          \
                             background.color=$TRANSPARENT
