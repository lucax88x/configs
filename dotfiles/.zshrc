# if you need to profile
# zmodload zsh/zprof
 
if [[ $INTELLIJ_ENVIRONMENT_READER ]]; then
  return
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

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
zinit ice depth=1

# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-completions
zinit light MichaelAquilina/zsh-auto-notify
# zinit light zdharma-continuum/history-search-multi-word
# zinit snippet OMZ::lib/history.zsh 

zinit snippet OMZ::plugins/git/git.plugin.zsh

# autocomplete
# zinit snippet OMZ::plugins/docker/_docker

# those should stay last
# 
zinit light zsh-users/zsh-autosuggestions
# for some reason really slow in osx
# zinit light zdharma-continuum/fast-syntax-highlighting
#

# COMPINIT 
autoload -Uz compinit
compinit
zinit cdreplay -q

# ENV VAR
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export VOLTA_HOME="$HOME/.volta"
export EDITOR=nvim
export VISUAL=nvim
export MANGOHUD=1

# emacs
export PATH="$PATH:$HOME/.config/emacs/bin"

source "$HOME/.zshrc.env"
# END ENV VAR


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# end pyenv

# go
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
# end go

source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
source "$HOME/bin/functions/ks"

# awaits, necessary for vi mode
zinit ice lucid wait
# zinit snippet OMZP::fzf
zinit light Aloxaf/fzf-tab
# zinit light Tarrasch/zsh-bd
# zinit snippet $HOME/.fzf.zsh
#
zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
# zinit light g-plane/zsh-yarn-autocompletions

# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
# zinit light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
zinit load atuinsh/atuin

# zinit snippet OMZ::lib/key-bindings.zsh 
 
eval "$(zoxide init zsh)"
# gh completion -s zsh > /Users/luca.trazzi/.zinit/completions/_gh
# https://cli.github.com/manual/gh_completion

# END PLUGINS

# ALIASES
alias k='kubectl'
alias c='xclip -selection clipboard'
alias v='nvim'
alias nv='neovide'

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

[[ ! -f $HOME/.p10k.zsh ]] || zinit snippet $HOME/.p10k.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/pnpm.zsh ]] && . ~/.config/tabtab/zsh/pnpm.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.zinit/snippets/Users--luca.trazzi/.p10k.zsh/.p10k.zsh.
[[ ! -f ~/.zinit/snippets/Users--luca.trazzi/.p10k.zsh/.p10k.zsh ]] || source ~/.zinit/snippets/Users--luca.trazzi/.p10k.zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/repos/configs/dotfiles/.p10k.zsh.
[[ ! -f ~/repos/configs/dotfiles/.p10k.zsh ]] || source ~/repos/configs/dotfiles/.p10k.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/luca.trazzi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# zprof
