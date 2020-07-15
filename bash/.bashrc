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

#Prompt
export PS1='\[\033[33m\]\W \[\033[32m\]>> \[\033[37m\]'

# User specific aliases and functions
alias open='xdg-open'                  # For opening in a graphical application
alias reload='source $HOME/.bashrc'    # For an easier time sourcing this file

