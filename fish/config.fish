set -g fish_greeting
set -x TERM xterm-256color
set PATH $PATH ~/.local/bin

source $HOME/.config/scripts-common/aliases.sh
source $HOME/.config/scripts-common/ytdlp.sh
source $HOME/.config/scripts-common/storage_setup.sh

fish_config theme choose TokyoNight_Night

#                                 _   
# _ __  _ __ ___  _ __ ___  _ __ | |_ 
#| '_ \| '__/ _ \| '_ ` _ \| '_ \| __|
#| |_) | | | (_) | | | | | | |_) | |_ 
#| .__/|_|  \___/|_| |_| |_| .__/ \__|
#|_|                       |_|        

starship init fish | source
