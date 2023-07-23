#!/usr/bin/zsh

echo "Creating symlinks from repo to home directory"

echo -n "Are you want to continue (y/n)?"
read CONT

if [ "$CONT" = "n" ]; then
    echo "Aborting"
    exit 1
fi


HOME_DIR="$HOME"

ARRAY_OSX=(
    .config/kitty
    .config/nvim
    .config/ranger/rc.conf
    .config/yabai
    .gitconfig
    .hammerspoon
    bin
    .ideavimrc
    .zshrc
    .p10k.zsh
    .zprofile
    .tmux.conf
    .local/share/navi/cheats/lucatrazzi__cheats
    .ssh/config
    backgrounds
)

ARRAY_LINUX=(
    .config/rofi
    .config/dunst/dunstrc
    .config/kitty
    .config/nvim
    .config/X11
    .config/polybar
    .config/fontconfig/fonts.conf
    .config/i3/config
    .config/chrome-flags.conf
    .config/ranger/rc.conf
    .config/gtk-3.0/settings.ini
    .gitconfig
    bin
    .ideavimrc
    .zshrc
    .p10k.zsh
    .zprofile
    .tmux.conf
    .imwheelrc
    .local/share/navi/cheats/lucatrazzi__cheats
    .ssh/config
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

for ((I = 1; I < $#ARRAY_OSX + 1; I++)); do
  VALUE=$ARRAY_OSX[$I]
  echo $VALUE
  echo $PWD
  FROM="$PWD/dotfiles/$VALUE"
  TO="$HOME_DIR/$VALUE"
  sync $FROM $TO
done
