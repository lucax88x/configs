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
    [~/.config/rofi/config.rasi]=./dotfiles/.config/rofi/config.rasi
    [~/.config/rofi/options_menu.rasi]=./dotfiles/.config/rofi/options_menu.rasi
    [~/.config/rofi/confirm_menu.rasi]=./dotfiles/.config/rofi/confirm_menu.rasi
    [~/.config/dunst/dunstrc]=./dotfiles/.config/dunst/dunstrc
    [~/.config/kitty/kitty.conf]=./dotfiles/.config/kitty/kitty.conf
    [~/.config/picom/picom.conf]=./dotfiles/.config/picom/picom.conf
    [~/.conkyrc]=./dotfiles/.conkyrc
    [~/.gitconfig]=./dotfiles/.gitconfig
    [~/bin/*]=./scripts
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

if [ "$TYPE" == "down" ]; then
    chmod +x ~/bin -R
fi