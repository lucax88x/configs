#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  SPACE_NAME=space.$sid
  
	# --subscribe system.yabai window_focus_spaces \
  sketchybar --add space      "$SPACE_NAME" left                               \
             --set "$SPACE_NAME" associated_space=$sid                         \
             --set "$SPACE_NAME" script="$PLUGIN_DIR/yabai.sh" \
	updates=on \
                              icon.font="$ICON_FONT"\
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=22                          \
                              icon.padding_right=22                         \
                              label.padding_right=33                        \
                              label.color="$FG_4" \
                              icon.highlight_color="$FG_4"                     \
                              background.padding_left=-8                    \
                              background.padding_right=-8                   \
                              background.height=26                          \
                              background.corner_radius=9                    \
                              background.color="$SPACE_BACKGROUND"            \
                              background.drawing=on                         \
                              label.drawing=off                             \
                              click_script="$SPACE_CLICK_SCRIPT"
done

sketchybar   --add item       separator left                          \
             --set separator  icon=                                  \
                              icon.font="Hack Nerd Font:Regular:16.0" \
                              background.padding_left=26              \
                              background.padding_right=15             \
                              label.drawing=off                       \
                              associated_display=active               \
                              icon.color="$WHITE"
