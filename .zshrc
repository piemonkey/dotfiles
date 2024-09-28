# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rich/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

##### Additional shell tweaks

autoload zmv

##### Conveniences and path

source ~/.env

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-props
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval $(<~/.ssh-agent-props) > /dev/null
fi

# Mise-en-place
eval "$(mise activate zsh)"

# zoxide
eval "$(zoxide init zsh)"

# Ruby gems
#PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# Yarn globals
PATH=$PATH:~/.yarn/bin

# Android dev
ANDROID_HOME=/opt/android-sdk

##### Prompt and bindings

# Manual zsh config
bindkey '^R' history-incremental-pattern-search-backward

# Liquidprompt for prompt info
source /usr/bin/liquidprompt

# Vim!
EDITOR=/usr/bin/nvim
SUDO_EDITOR=/usr/bin/vim

##### Aliases

# Random aliases
alias ls='ls --color=auto'

# Meteor
# alias meteor='LC_ALL=en_GB.UTF-8 ~/.meteor/meteor'
alias meteor='LC_ALL=en_GB.UTF-8 meteor'

# Configuring external monitors
alias dual-hd-right='xrandr --output eDP-1 --auto --primary --output DP-1 --auto --right-of eDP-1'
alias dual-hd-above='xrandr --output eDP-1 --auto --primary --output DP-1 --auto --above eDP-1'
alias single-hd-external='xrandr --output eDP-1 --off --output DP-1 --auto --primary' 
alias single-hd-internal='xrandr --output eDP-1 --auto --primary --output DP-1 --off'
alias mirror-unscaled='xrandr --output eDP-1 --auto --output DP-1 --auto --same-as eDP-1'
# HiDPI
# alias dual-hd-right='xrandr --output eDP-1 --auto --primary --output DP-1 --auto --panning 3200x1800+3200+0 --scale-from 3200x1800 --right-of eDP-1'
# alias dual-unscaled-right='xrandr --output eDP-1 --auto --primary --output DP-1 --auto --panning 0x0 --scale 1x1 --right-of eDP-1'
# alias single-hd='xrandr --output eDP-1 --off --output DP-1 --auto --primary --panning 3200x1800 --scale-from 3200x1800'
# alias single-unscaled='xrandr --output eDP-1 --off --output DP-1 --auto --panning 0x0 --scale 1x1'
# alias mirror-unscaled='xrandr --output eDP-1 --auto --mode 1920x1080 --output DP-1 --auto --same-as eDP-1'

# sshfs
alias sshfs-media-home='sshfs mac-mini-home:media ~/mnt'
alias sshfs-media='sshfs -C mac-mini:media ~/mnt'

# Watchman hack
alias watchman-reset='watchman watch-del-all && watchman shutdown-server'

# Mobile dev
alias adlink='adb shell am start -a android.intent.action.VIEW'
alias ademu='/opt/android-sdk/emulator/emulator'

# Docker perms
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
