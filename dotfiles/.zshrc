if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# sets nvim as default editor
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
# add yarn globals to path
export PATH="$(yarn global bin):$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/lucatrazzi/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

if [ `tput colors` != "256" ]; then  
  ZSH_THEME="robbyrussell"  
fi 

plugins=(
	command-not-found
	git 
	colored-man-pages 
	history
	npm 
	yarn 
	docker 
	dotnet 
	zsh-autosuggestions 
	zsh-syntax-highlighting 
	fzf-tab	
)

source $ZSH/oh-my-zsh.sh

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

REPOSITORIES_FOLDER=~/repos
function prj(){
  cd $REPOSITORIES_FOLDER/$1
}
compctl -W $REPOSITORIES_FOLDER -/ prj

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# zsh-bd
. ~/.oh-my-zsh/custom/plugins/bd/bd.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/lucatrazzi/.config/broot/launcher/bash/br
source /usr/share/nvm/init-nvm.sh

# zoxide
eval "$(zoxide init zsh)"
