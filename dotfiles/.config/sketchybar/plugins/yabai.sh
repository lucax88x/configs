#!/bin/bash

window_state() {
	source "$HOME/.config/sketchybar/colors.sh"
	source "$HOME/.config/sketchybar/icons.sh"

	WINDOW=$(yabai -m query --windows --window)
	CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

	args=()
	if [[ $CURRENT -gt 0 ]]; then
		LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
		args+=(--set "$NAME" icon="$YABAI_STACK" icon.color="$FG_3" label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))

	else
		args+=(--set "$NAME" label.drawing=off)
		case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
		"false")
			if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
				args+=(--set "$NAME" icon="$YABAI_FULLSCREEN_ZOOM" icon.color="$GREEN")
			elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
				args+=(--set "$NAME" icon="$YABAI_PARENT_ZOOM" icon.color="$BLUE")
			else
				args+=(--set "$NAME" icon="$YABAI_GRID" icon.color=0xfff0c6c6)
			fi
			;;
		"true")
			args+=(--set "$NAME" icon="$YABAI_FLOAT" icon.color="$MAGENTA")
			;;
		esac
	fi

	sketchybar -m "${args[@]}"
}

mouse_clicked() {
	yabai -m window --toggle float
	update
}

case "$SENDER" in
"mouse.clicked")
	mouse_clicked
	;;
"forced")
	exit 0
	;;
"window_focus")
	window_state
	;;
esac
