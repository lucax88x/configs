#!/bin/bash
#
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
	BATTERY_ICON=$BATTERY_FULL
	;;
[6-8][0-9])
	BATTERY_ICON=$BATTERY_75
	;;
[3-5][0-9])
	BATTERY_ICON=$BATTERY_50
	;;
[1-2][0-9])
	BATTERY_ICON=$BATTERY_25
	;;
*) BATTERY_ICON=$BATTERY_0 ;;
esac

if [[ $CHARGING != "" ]]; then
	BATTERY_ICON=$BATTERY_CHARGING
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$BATTERY_ICON" label="${PERCENTAGE}%"
