#!/usr/bin/zsh

echo "Creating symlinks from repo to home directory"

echo -n "Are you want to continue (y/n)?"
read CONT

if [ "$CONT" = "n" ]; then
    echo "Aborting"
    exit 1
fi


HOME_DIR="$HOME"

ARRAY=(
    .config/rofi
    .config/dunst/dunstrc
    .config/kitty/kitty.conf
    .config/picom/picom.conf
    .config/nvim
    .config/X11
    .config/ranger/rc.conf
    .config/polybar
    .config/fontconfig/fonts.conf
    .config/gitui/key_config.ron
    .config/efm-langserver
    .config/i3/config
    .config/chrome-flags.conf
    .gitconfig
    bin
    .ideavimrc
    .zshrc
    .p10k.zsh
    .zprofile
    .tmux.conf
    .tmuxinator
    .config/ranger/rc.conf
    .local/share/navi/cheats/lucatrazzi__cheats
    backgrounds
)

function sync()
{
    FROM=$1
    TO=$2

    echo PROCESSING $FROM to $TO
    
    if [ -L ${TO} ] ; then
      if [ -e ${TO} ] ; then
         echo "Good link, skipping"
      else
         echo "Broken link, stopping"
         exit 1
      fi
    elif [ -e ${TO} ] ; then
      echo "Not a link, stopping"
      exit 1
    else
      
      if [ -d "$TO" ]; then
          echo "is directory $TO"
          mkdir -p $TO
      else
          TO_DIR=$(dirname $TO)
          echo $TO_DIR
          mkdir -p $TO_DIR
      fi
      
      ln -s $FROM $TO
      
      echo "Created!"
    fi
}

mkdir -p $HOME_DIR

for ((I = 1; I < $#ARRAY + 1; I++)); do
  VALUE=$ARRAY[$I]
  FROM="$PWD/dotfiles/$VALUE"
  TO="$HOME_DIR/$VALUE"
  sync $FROM $TO
done
