# Created by newuser for 5.8
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[%n@%m %1~]$ '
neofetch
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/konner/.local/bin
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/konner/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
