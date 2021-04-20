# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh/share/antigen.zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Aloxaf/fzf-tab
antigen bundle Tarrasch/zsh-bd

antigen theme romkatv/powerlevel10k
if [ `tput colors` != "256" ]; then  
	antigen theme robbyrussell
fi 

antigen apply

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
# sets nvim as default editor
export EDITOR=nvim
export VISUAL=nvim

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
# add yarn globals to path
export PATH="$(yarn global bin):$PATH"

# # change zsh vim escape to jk
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# plugins=(
# 	command-not-found
# 	zsh-vi-mode
# 	git 
# 	colored-man-pages 
# 	history
# 	npm 
# 	yarn 
# 	docker 
# 	dotnet 
# 	zsh-autosuggestions 
# 	zsh-syntax-highlighting 
# 	fzf-tab	
# )

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

# bd to do
# [ -f ~/.bd.zsh ] && source ~/.bd.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/lucatrazzi/.config/broot/launcher/bash/br
source /usr/share/nvm/init-nvm.sh
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
#END SOURCES

# To customize prompt, run p10k configure or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
