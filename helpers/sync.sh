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
    [~/.config/rofi]=./dotfiles/.config
    [~/.config/dunst/dunstrc]=./dotfiles/.config/dunst/dunstrc
    [~/.config/kitty/kitty.conf]=./dotfiles/.config/kitty/kitty.conf
    [~/.config/picom/picom.conf]=./dotfiles/.config/picom/picom.conf
    [~/.config/nvim]=./dotfiles/.config
    [~/.config/X11]=./dotfiles/.config
    [~/.config/ranger/rc.conf]=./dotfiles/.config/ranger/rc.conf
    [~/.gitconfig]=./dotfiles/.gitconfig
    [~/bin/]=./scripts/
    [~/.ideavimrc]=./dotfiles/.ideavimrc
    [~/.zprofile]=./dotfiles/.zprofile
    [~/.tmux.conf]=./dotfiles/.tmux.conf
    [~/.tmuxinator]=./dotfiles
)

function sync()
{
    FROM=$1
    TO=$2

    FROM_DIR=$(dirname $FROM)
    TO_DIR=$(dirname $TO)

    if [ -d "$FROM" ]; then
        mkdir -p $TO
        rsync -au $FROM $TO
    else
        mkdir -p $TO_DIR
        rsync -au $FROM $TO
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
