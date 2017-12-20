# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Alias definations
if [ -f ~/.bin/.env_alias ]; then
        . ~/.bin/.env_alias
fi

# PATH
export PATH="$HOME/.bin:$PATH"
