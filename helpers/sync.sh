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
    [~/.config/nvim]=./dotfiles/.config/nvim
    [~/.config/ranger/rc.conf]=./dotfiles/.config/ranger/rc.conf
    [~/.conkyrc]=./dotfiles/.conkyrc
    [~/.gitconfig]=./dotfiles/.gitconfig
    [~/.Xmodmap]=./dotfiles/.Xmodmap
    [~/bin/]=./scripts/
    [~/.doom.d]=./dotfiles/.doom.d/
    [~/.ideavimrc]=./dotfiles/.ideavimrc
    [~/.tmux.conf]=./dotfiles/.tmux.conf
    [~/.tmuxinator]=./dotfiles/.tmuxinator
)

function sync()
{
    FROM=$1
    TO=$2

    FROM_DIR=$(dirname $FROM)
    TO_DIR=$(dirname $TO)

    if [ -d "$FROM" ]; then
        mkdir -p $TO
        rsync -auv $FROM $TO
    else
        mkdir -p $TO_DIR
        rsync -auv $FROM $TO
    fi
}

for KEY in "${!pairs[@]}"; do
    VALUE="${pairs[$KEY]}"

    KEY_DIR=$(dirname $KEY)
    VALUE_DIR=$(dirname $VALUE)

    if [ "$TYPE" == "up" ]; then
        sync $KEY $VALUE
    else
        sync $VALUE $KEY
    fi
done

if [ "$TYPE" == "down" ]; then
    chmod +x ~/bin -R
fi
