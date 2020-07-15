# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Enable colorized output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Prompt
# -----------------------------------------------------------------------------

# Settings for git prompt
source ./.config/bash/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

# Function to construct a dynaminc bash prompt
__prompt_command() {
	
	local EXIT="$?"             # Perserve the exit code of the last used application
	
	PS1=""
	
	local PROMPT_SYMBOL='¬'     # Place the symbol for your prompt here
	
	local COLOR_RED='\033[0;31m'
	local COLOR_YELLOW='\033[0;33m'
	local COLOR_GREEN='\033[0;32m'
	local COLOR_OCHRE='\033[38;5;95m'
	local COLOR_BLUE='\033[0;34m'
	local COLOR_WHITE='\033[0;37m'
	local COLOR_RESET='\033[0m'
	
	PS1+="${COLOR_RESET}${COLOR_YELLOW}\W${COLOR_RESET}${COLOR_BLUE}$(__git_ps1 ' (%s)'${COLOR_RESET})"
	
	# Add the prompt symbol
	if [ $EXIT != 0 ]; then
		# If the last command had a nonzero exit code, make the symbol red
        PS1+="${COLOR_RED} ${PROMPT_SYMBOL} ${COLOR_RESET}"
    else
    	# Otherwise, make it green
        PS1+="${COLOR_GREEN} ${PROMPT_SYMBOL} ${COLOR_RESET}"
    fi
}

PROMPT_COMMAND=__prompt_command

# User specific aliases and functions
# -----------------------------------------------------------------------------
alias open='xdg-open'                  # For opening in a graphical application
alias reload='source $HOME/.bashrc'    # For an easier time sourcing this file
alias cls='clear'                      # Makes clearing the screen less annoying
alias sudo='sudo '                     # Enable sudoing for aliases
alias __=sudo                          # Make using sudo less annoying
