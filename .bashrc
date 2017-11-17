# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
	. ~/.config/exercism/exercism_completion.bash
fi

# User specific aliases and functions
#export PATH=$HOME/bin:$PATH
#export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin
#export PATH=$PATH:$HOME/bin
#export PATH=$PATH:$HOME/.cargo/bin
