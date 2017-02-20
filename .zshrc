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

##### Conveniences and path

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-props
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-props) > /dev/null
fi

# Ruby gems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

##### Prompt and bindings

# Manual zsh config
bindkey '^R' history-incremental-pattern-search-backward

# Liquidprompt for prompt info
source /usr/bin/liquidprompt

##### Aliases

# Random aliases
alias ls='ls --color=auto'

# Meteor
alias meteor='LC_ALL=en_GB.UTF-8 ~/.meteor/meteor'

# Configuring external monitors
alias dual-hd-right='xrandr --output eDP-1 --auto --output DP-1 --auto --panning 3200x1800+3200+0 --scale 1.66667x1.66667 --right-of eDP-1'

# sshfs
alias sshfs-media-home='sshfs -C mac-mini-home:media ~/mac'
alias sshfs-media='sshfs -C mac-mini:media ~/mac'

