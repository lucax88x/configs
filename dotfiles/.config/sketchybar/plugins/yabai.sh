#!/bin/bash

window_focus_update_front_app() {
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

space_change_update_space_label() {
	source "$HOME/.config/sketchybar/colors.sh"
	source "$HOME/.config/sketchybar/icons.sh"

	CURRENT_SPACE=$(yabai -m query --spaces --space)
	CURRENT_SPACE_INDEX=$(echo "$CURRENT_SPACE" | jq '.index' -r)
	CURRENT_SPACE_LABEL=$(echo "$CURRENT_SPACE" | jq '.label' -r)

	args=()
	if [[ $NAME == "space.$CURRENT_SPACE_INDEX" ]]; then
		args+=(--set "$NAME" label.drawing=on label="$CURRENT_SPACE_LABEL")
	else
		args+=(--set "$NAME" label.drawing=off)
	fi

	sketchybar -m "${args[@]}"
}

init_spaces() {
	source "$HOME/.config/sketchybar/colors.sh"
	source "$HOME/.config/sketchybar/icons.sh"

	SPACES=$(yabai -m query --spaces)
	SPACE_INDEX=$(echo "$NAME" | cut -d '.' -f 2)

	# not a number
	if ! [[ $SPACE_INDEX =~ ^[0-9]+$ ]]; then
		exit 0
	fi

	SPACE_BY_INDEX=$(echo "$SPACES" | jq ".[] | select(.index==$SPACE_INDEX)" -r)
	SPACE_LABEL=$(echo "$SPACE_BY_INDEX" | jq ".label" -r)

	args=()

	case "$SPACE_LABEL" in
	"terminal")
		icon=$TERMINAL
		;;
	esac

	if [ -n "$icon" ]; then
		args+=(--set "$NAME" label.drawing=off icon="$icon")

		sketchybar -m "${args[@]}"
	fi

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
	init_spaces
	;;
"window_focus")
	window_focus_update_front_app
	;;
"space_change")
	# space_change_update_space_label
	;;
esac
