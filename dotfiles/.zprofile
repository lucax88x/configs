if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx ~/.config/X11/xinitrc
fi

export PATH="/opt/homebrew/bin:$PATH" # add brew for OSX
export PATH="$HOME/bin:$PATH"

# add yarn globals to path
# export PATH="$(yarn global bin):$PATH"
# add local bin (python executables, for example)
export PATH="$HOME/.local/bin:$PATH"

# add dotnet globals to path
export PATH="/usr/share/dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# bob
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

# used by jetbrains toolbox for OSX
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/repos/dotmemory"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
