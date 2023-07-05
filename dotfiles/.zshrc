# if you need to profile
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZINIT
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zpcompinit; zpcdreplay

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-{'readurl','bin-gem-node','patch-dl','rust'}


### END ZINIT

if [ `tput colors` = "256" ]; then  
  if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    zinit light romkatv/powerlevel10k
  fi
fi 

# PLUGINS
# zinit ice depth=1
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# zinit light jeffreytse/zsh-vimode

zinit light zsh-users/zsh-completions
zinit light MichaelAquilina/zsh-auto-notify
# zinit light zdharma-continuum/history-search-multi-word
zinit snippet OMZ::lib/history.zsh 

zinit snippet OMZ::plugins/git/git.plugin.zsh

# autocomplete
zinit snippet OMZ::plugins/docker/_docker

# those should stay last
# 
zinit light zsh-users/zsh-autosuggestions
# for some reason really slow in osx
# zinit light zdharma-continuum/fast-syntax-highlighting

# ENV VAR
export VOLTA_HOME="$HOME/.volta"
export PATH="/opt/homebrew/bin:$PATH" # add brew for OSX
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=nvim
export VISUAL=nvim
export MANGOHUD=1

export PATH="$HOME/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
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

# export DOTNET_ROOT="$(dirname "$(readlink "$(command -v dotnet)")")"
# export DOTNET_ROOT="$HOME/.dotnet"
# END ENV VAR
 
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
source "$HOME/bin/functions/ks"

# awaits, necessary for vi mode
zinit ice lucid wait
zinit snippet OMZP::fzf
zinit light Aloxaf/fzf-tab
zinit light Tarrasch/zsh-bd
# zinit snippet $HOME/.fzf.zsh
#
zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
zinit light g-plane/zsh-yarn-autocompletions

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zinit snippet OMZ::lib/key-bindings.zsh 
 
eval "$(zoxide init zsh)"
# gh completion -s zsh > /Users/luca.trazzi/.zinit/completions/_gh
# https://cli.github.com/manual/gh_completion

# END PLUGINS

# ALIASES
alias k='kubectl'
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

# END ALIASES

# FUNCTIONS
REPOSITORIES_FOLDER=~/repos
function prj(){
  cd $REPOSITORIES_FOLDER/$1
}
compctl -W $REPOSITORIES_FOLDER -/ prj
# END FUNCTIONS

[[ ! -f $HOME/.p10k.zsh ]] || zinit snippet $HOME/.p10k.zsh

# zprof

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/pnpm.zsh ]] && . ~/.config/tabtab/zsh/pnpm.zsh || true
