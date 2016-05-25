#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# my aliases
alias install='sudo pacman -S'
alias search='pacman -Ss'
alias uninstall='sudo pacman -R'
alias aurinstall='aurget -S'
alias aursearch='aurget -Ss'
alias auruninstall='aurget -R'
