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
)

for KEY in "${!pairs[@]}"; do
    VALUE="${pairs[$KEY]}"

    
    KEY_DIR=$(dirname $KEY)
    VALUE_DIR=$(dirname $VALUE)
    
    if [ "$TYPE" == "up" ]; then
        echo "Uploading $KEY to $VALUE"
        mkdir -p $VALUE_DIR
        cp $KEY $VALUE
    else
        echo "Downloading $VALUE to $KEY"
        mkdir -p $KEY_DIR
        cp -vaR $VALUE $KEY
    fi
done