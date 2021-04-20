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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zinit load zsh-users/zsh-autosuggestions
zinit load zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh
zinit snippet OMZ::plugins/npm/npm.plugin.zsh
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

# zinit load Aloxaf/fzf-tab
# zinit load Tarrasch/zsh-bd
# zinit load lukechilds/zsh-better-npm-completion
zinit load jeffreytse/zsh-vi-mode

if [ `tput colors` = "256" ]; then  
	zinit load romkatv/powerlevel10k
fi 

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
# sets nvim as default editor
export EDITOR=nvim
export VISUAL=nvim

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
# add yarn globals to path
export PATH="$(yarn global bin):$PATH"

# change zsh vim escape to jk
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


# SOURCES
REPOSITORIES_FOLDER=~/repos
function prj(){
  cd $REPOSITORIES_FOLDER/$1
}
compctl -W $REPOSITORIES_FOLDER -/ prj


source $HOME/.config/broot/launcher/bash/br
source /usr/share/nvm/init-nvm.sh
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
source $HOME/.fzf.zsh

#END SOURCES

# To customize prompt, run p10k configure or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
