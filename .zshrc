# The following lines were added by compinstall
zstyle :compinstall filename '/home/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

alias ..='cd ..'
alias ...='cd ...'
alias ls='exa --color=always -a'

source "$HOME/.cargo/env"

export GIT_EDITOR="nvim"
export EDITOR="nvim"

export PATH="${PATH}:$HOME/.local/bin"

autoload zmv
alias vc='vorbiscomment'
alias rl='source ~/.zshrc'

eval "$(starship init zsh)"
