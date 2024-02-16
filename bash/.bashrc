#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GREP_OPTIONS=' --color=auto'
export EDITOR=nvim

HISTCONTROL=ignoredups
HISTSIZE=20000
HISTFILESIZE=10000
shopt -s histappend

alias ls='ls --color=auto'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias pa='php artisan'

# Prompt
#PS1='[\u@\h \W]\$ '
PS1='\[\e]2; \h::\W\a\][\u@\h \W]\$ '
#source ~/.bash_prompt

# Completions
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

complete -C /usr/local/bin/trellis trellis

source /etc/bash_completion.d/console

if [ -z "${TMUX}" ]; then
	$HOME/bin/colorscript -r
fi
