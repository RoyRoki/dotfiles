#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
eval "$(zoxide init bash)"
export TERMINAL=kitty
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Shortcuts
alias nv="nvim"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
