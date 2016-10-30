# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rich/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Liquidprompt for prompt info
source /usr/bin/liquidprompt

