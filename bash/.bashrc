# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Environment Variables
# -----------------------------------------------------------------------------

# PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export JAVA_HOME="/usr/lib/jvm/java-14-openjdk-14.0.1.7-2.rolling.fc32.x86_64"
# export EDITOR='emacsclient -t'
# export VISUAL='emacsclient -t'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Prompt
# -----------------------------------------------------------------------------

# Settings for git prompt
source $HOME/.config/bash/git-prompt.sh
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
	
	# YAY COLORS!!!
	local COLOR_BLACK="\[$(tput setaf 0)\]"
	local COLOR_RED="\[$(tput setaf 1)\]"
	local COLOR_GREEN="\[$(tput setaf 2)\]"
	local COLOR_YELLOW="\[$(tput setaf 3)\]"
        local COLOR_BLUE="\[$(tput setaf 4)\]"
	local COLOOR_MAGENTA="\[$(tput setaf 5)\]"
	local COLOR_CYAN="\[$(tput setaf 6)\]"
	local COLOR_WHITE="\[$(tput setaf 7)\]"
	local COLOR_RESET="\[$(tput sgr0)\]"
	
	# Append bulk of prompt
	PS1+="${COLOR_RESET}${COLOR_YELLOW}\W${COLOR_RESET}${COLOR_BLUE}$(__git_ps1 ' (%s)'${COLOR_RESET})"
	
	# Add the prompt symbol
	if [ $EXIT != 0 ]; then
	# If the last command had a nonzero exit code, make the symbol red
        PS1+="${COLOR_RED} ${PROMPT_SYMBOL} ${COLOR_RESET}"
        tput bel
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
alias lal="ls -la"
alias lsd="ls -lF | grep --color=never '^d'"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Enable colorized output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
