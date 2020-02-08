TYPE=${1:-'up'}

if [ "$TYPE" == "up" ]; then
    echo "Uploading (PC => REPO)"
else
    echo "Downloading  (REPO => PC)"
fi

read -p "Are you want to continue (y/n)?" CONT

if [ "$CONT" = "n" ]; then
    echo "Aborting"
    exit 1
fi

declare -A pairs=(
    [~/.config/i3/config]=./dotfiles/.config/i3/config
    [~/.config/polybar/colors]=./dotfiles/.config/polybar/colors
    [~/.config/polybar/config]=./dotfiles/.config/polybar/config
    [~/.config/polybar/launch.sh]=./dotfiles/.config/polybar/launch.sh
    [~/.config/kitty/kitty.conf]=./dotfiles/.config/kitty/kitty.conf
)

for KEY in "${!pairs[@]}"; do
    VALUE="${pairs[$KEY]}"

    
    KEY_DIR=$(dirname $KEY)
    VALUE_DIR=$(dirname $VALUE)
    
    if [ "$TYPE" == "up" ]; then
        mkdir -p $VALUE_DIR
        cp $KEY $VALUE
    else
        mkdir -p $KEY_DIR
        cp -vaR $VALUE $KEY
    fi
done