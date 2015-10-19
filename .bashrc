#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTIGNORE="ls:l:l -rt:cd:logout:exit:echo:"

export CDPATH="~/dev"


export LD_LIBRARY_PATH=/usr/local/lib64

shopt -s checkwinsize autocd cdspell

# Give colorized prompt
function color_my_prompt {
    local __user_and_host="\[\033[0;32m\]\u\[\033[00m\]@\[\033[36m\]\h"
    local __cur_location="\[\033[01;36m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

color_my_prompt

# ls aliases
alias ls='ls --color=auto -F'
alias ll='ls -CA'
alias la='ls -a'
alias l='ls -lha'

# OpenGL compilation
alias gl++="g++ -lGL -lGLU -lglut -lGLEW" 

# Git aliases
alias gits='git status'
alias gitc='git commit'
alias gita='git add'
alias gitd='git diff'
alias gitp='git push'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;38m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;1m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;15m' \
    man "$@"
}

# Force tmux to use 256 colors
alias tmux='tmux -2'

export PAGER='less -S -L'
export EDITOR=vim
export PATH
