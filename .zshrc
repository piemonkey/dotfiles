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

# Pnpm globals
export PNPM_HOME=~/.local/share/pnpm
PATH=$PATH:$PNPM_HOME

# Android dev
#ANDROID_HOME=/opt/android-sdk

# Docker Ember
PATH=$PATH:~/coding/redpencil/docker-ember/bin

# Docker rootless
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Mu CLI (semtech CLI)
PATH=$PATH:~/coding/redpencil/mu-cli/
## Currently bash completions only used for mu-cli:
autoload -U +X bashcompinit
bashcompinit
source ~/coding/redpencil/mu-cli/completions

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

# Docker conveniences
comp() {
	local DOCKER_FILES=(-f docker-compose.yml)
	if [ -e "docker-compose.dev.yml" ]; then
		local DOCKER_FILES=($DOCKER_FILES -f docker-compose.dev.yml)
	fi
	if [ -e "docker-compose.override.yml" ]; then
		local DOCKER_FILES=($DOCKER_FILES -f docker-compose.override.yml)
	fi
	local COMMAND=$1
	shift
	if [[ "$COMMAND" == "up" ]]; then
		if [[ "$1" == "-D" ]]; then
			local COMMAND=(up)
			1=""
			shift
		elif [[ "$1" != "-d" ]]; then
			local COMMAND=(up -d)
		fi
	fi
	if [[ "$COMMAND" == (up -d) ]] || [[ "$COMMAND" == "start" ]] || [[ "$COMMAND" == "restart" ]]; then
		if [[ "$COMMAND" == (up -d) ]]; then
			local ORPHANS="--remove-orphans"
		fi
		docker compose $DOCKER_FILES $COMMAND $ORPHANS "$@" && docker compose logs -fn 200
	else
		docker compose $DOCKER_FILES $COMMAND $@
	fi
}
comp-up() {
	docker compose up -d $@ && docker compose logs -fn 200
}
alias comp-dev='docker compose -f docker-compose.yml -f docker-compose.dev.yml'
comp-dev-up() {
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d --remove-orphans $@ && docker compose logs -fn 200
}
alias dockly='docker run -it --rm -v /run/user/1000/docker.sock:/var/run/docker.sock lirantal/dockly'
