#
# ~/.bash_profile
#

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec sway
