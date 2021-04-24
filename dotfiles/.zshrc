
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZINIT
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### END ZINIT

# PLUGINS
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

zinit snippet OMZ::lib/key-bindings.zsh 
zinit snippet OMZ::lib/history.zsh 

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh
zinit snippet OMZ::plugins/npm/npm.plugin.zsh

zinit light Aloxaf/fzf-tab
zinit light Tarrasch/zsh-bd
zinit light jeffreytse/zsh-vi-mode

# those should stay last
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
 
zinit snippet $HOME/.config/broot/launcher/bash/br
source /usr/share/nvm/init-nvm.sh
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
zinit snippet $HOME/.fzf.zsh


# END PLUGINS

if [ `tput colors` = "256" ]; then  
	zinit light romkatv/powerlevel10k
fi 

# ENV VAR
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=nvim
export VISUAL=nvim

export PATH=$HOME/bin:$PATH
# add yarn globals to path
export PATH="$(yarn global bin):$PATH"
# END ENV VAR

# # change zsh vim escape to jk
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# ALIASES
alias k='kubectl'
alias c='xclip -selection clipboard'
alias v='nvim'

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias v+='f(){ amixer -q sset Master "$@"%+;  unset -f f; }; f'
alias v-='f(){ amixer -q sset Master "$@"%-;  unset -f f; }; f'
# alias v='f(){ amixer -q sset Master toggle;  unset -f f; }; f'

alias tree='broot'
alias grep='rg'
alias find='fd'
# alias ps='procs'
alias crashed='journalctl --since=today'
# END ALIASES

# FUNCTIONS
REPOSITORIES_FOLDER=~/repos
function prj(){
  cd $REPOSITORIES_FOLDER/$1
}
compctl -W $REPOSITORIES_FOLDER -/ prj
# END FUNCTIONS

[[ ! -f $HOME/.p10k.zsh ]] || zinit snippet $HOME/.p10k.zsh
