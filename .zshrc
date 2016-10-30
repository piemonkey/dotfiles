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

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-props
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-props) > /dev/null
fi


# Random aliases
alias ls='ls --color=auto'

# Meteor
alias meteor='LC_ALL=en_GB.UTF-8 ~/.meteor/meteor'

# Configuring external monitors
alias dual-hd-right='xrandr --output eDP-1 --auto --output DP-1 --auto --panning 3168x1782+3200+0 --scale 1.65x1.65 --right-of eDP-1'
