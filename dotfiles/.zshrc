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
zpcompinit; zpcdreplay

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### END ZINIT

if [ `tput colors` = "256" ]; then  
	zinit light romkatv/powerlevel10k
fi 

# PLUGINS
# zinit ice depth=1
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-completions
zinit light MichaelAquilina/zsh-auto-notify
# zinit light zdharma/history-search-multi-word
zinit snippet OMZ::lib/history.zsh 

zinit snippet OMZ::plugins/git/git.plugin.zsh

# those should stay last
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
 
source /usr/share/nvm/init-nvm.sh
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell

# awaits, necessary for vi mode
zinit ice lucid wait
zinit snippet OMZP::fzf
zinit light Aloxaf/fzf-tab
zinit light Tarrasch/zsh-bd
# zinit snippet $HOME/.fzf.zsh
#
zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
zinit light g-plane/zsh-yarn-autocompletions
zinit light lukechilds/zsh-better-npm-completion

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zinit snippet OMZ::lib/key-bindings.zsh 

# END PLUGINS

# ENV VAR
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/bin:$PATH"
# add yarn globals to path
export PATH="$(yarn global bin):$PATH"

# add dotnet globals to path
export PATH="/usr/share/dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"

# export DOTNET_ROOT="$(dirname "$(readlink "$(command -v dotnet)")")"
# export DOTNET_ROOT="$HOME/.dotnet"
# END ENV VAR

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

alias grep='rg'
alias find='fd'
# alias ps='procs'
alias crashed='journalctl --since=today'

alias ssk="kitty +kitten ssh"
alias br="broot"
alias lg="lazygit"

# END ALIASES

# FUNCTIONS
REPOSITORIES_FOLDER=~/repos
function prj(){
  cd $REPOSITORIES_FOLDER/$1
}
compctl -W $REPOSITORIES_FOLDER -/ prj
# END FUNCTIONS

[[ ! -f $HOME/.p10k.zsh ]] || zinit snippet $HOME/.p10k.zsh
