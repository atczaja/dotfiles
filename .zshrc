
# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# Set TERM to screen when might use tmux, else, xterm more 
# widely supported
#export TERM="xterm-256color"
#export TERM="screen-256color"

# Edit PATH
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:
export PATH

# Antigen
source /home/aczaja/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

# Powerlevel9k
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
# Basing colors off of Ocean (dark) Chris Kempson from terminal.sexy
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=007
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=000
POWERLEVEL9K_DIR_HOME_FOREGROUND=234
POWERLEVEL9K_DIR_HOME_BACKGROUND=012
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=234
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=012
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=234
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=225
antigen apply

# Exercism
if [ -f ~/.config/exercism/exercism_completions.zsh ]; then
	. ~/.config/exercism/exercism_completions.zsh
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aczaja/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
