# if you need to profile
# zmodload zsh/zprof
 
if [[ $INTELLIJ_ENVIRONMENT_READER ]]; then
  return
fi


# ENV VAR
export VOLTA_HOME="$HOME/.volta"
export PATH="/opt/homebrew/bin:$PATH" # add brew for OSX
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=nvim
export VISUAL=nvim
export MANGOHUD=1

export PATH="$HOME/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"

# pyenv
# export PATH="$(pyenv root)/shims:${PATH}"

# add yarn globals to path
# export PATH="$(yarn global bin):$PATH"
# add local bin (python executables, for example)
export PATH="$HOME/.local/bin:$PATH"

# add dotnet globals to path
export PATH="/usr/share/dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# used by jetbrains toolbox for OSX
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/repos/dotmemory"
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
export PATH="$PATH:$HOME/.config/emacs/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/luca.trazzi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# export DOTNET_ROOT="$(dirname "$(readlink "$(command -v dotnet)")")"
export DOTNET_ROOT="$(dirname $(which dotnet))"
# export DOTNET_ROOT="$HOME/.dotnet"
 
source "$HOME/.zshrc.env"
# END ENV VAR

eval "$(zoxide init zsh)"
# END PLUGINS

# ALIASES
alias g='git'
alias k='kubectl'
alias c='xclip -selection clipboard'
alias v='nvim'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# alias v+='f(){ amixer -q sset Master "$@"%+;  unset -f f; }; f'
# alias v-='f(){ amixer -q sset Master "$@"%-;  unset -f f; }; f'
# alias v='f(){ amixer -q sset Master toggle;  unset -f f; }; f'

alias grep='rg'
# alias find='fd'
# alias ps='procs'
alias crashed='journalctl --since=today'

alias ssk="kitty +kitten ssh"
alias lg="lazygit"
alias p="pnpm"
alias run="run.mjs"
alias zipgit="git archive HEAD -o ${PWD##*/}.zip"
# alias zip7git="7z a -bd ${PWD##*/}.7z * '-xr@./.gitignore'"

# END ALIASES

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
