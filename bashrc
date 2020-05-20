# ignore duplicates in history
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# Make history be larger than default
HISTSIZE=100000
HISTFILESIZE=200000

# Enable colors for ls and grep
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Bring in aliases from ~/.bashrc_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Source ros environment variables
source /opt/ros/melodic/setup.bash

# Needed to forward GUI windows to vcxsrv
export DISPLAY=:0
export LIBGL_ALWAYS_INDIRECT=

alias gohome="cd ~/robotics_ws && source devel/setup.bash"
alias _build="cd ~/robotics_ws && catkin build && source devel/setup.bash"
alias src="source ~/.bashrc"

# git aliases
alias gcm="git commit -m"
alias gd="git diff"
alias gb="git branch"
alias ga="git add"
alias gs="git status"
alias gco="git checkout"
alias gl="git log"

alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe" 
alias code="/mnt/c/Users/t-oferro/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
alias pydrake=" source /home/t-oferro/tmp/drake-venv/bin/activate && cd ~/drake && export PYTHONPATH=/opt/drake/lib/python3.6/site-packages:/opt/underactuated:${PYTHONPATH}"

# Customize bash env
export TERM='xterm-256color'
export EDITOR='vim'
export VISUAL='vim'
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

BLUE='\[\e[48;5;25m\]'
GRAY='\[\e[48;5;239m\]'
ORANGE='\[\e[48;5;166m\]'
RESET='\[\e[0m\]'

lambda="λ"
zeta="ζ"
sigma="Σ"
phi="φ"
delta="∆"
surf_integral="∮"
integral="∫"
git_symbol=""
segment_separator=""

parse_git_branch() {
	RESET='\x1\e[0m\x2'
	if [[ -d .git ]]; then
  		BRANCH_NAME="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"
  		GIT_COLOUR='\x1\e[48;5;32m\x2'
  		if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]]; then
  		      	GIT_COLOUR='\x1\e[48;5;172m\x2'
  		fi
  		echo -e "${GIT_COLOUR} ${git_symbol}${BRANCH_NAME} ${RESET}"
	else
		echo ""
	fi
}

export PS1="\t ${BLUE} \u ${RESET}${GRAY} \h ${RESET}${ORANGE} \w ${RESET}\$(parse_git_branch) ${lambda} "
unset BLUE GRAY ORANGE RESET

