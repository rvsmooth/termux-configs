#       _ _
#      | (_)
#  __ _| |_  __ _ ___  ___ ___
# / _` | | |/ _` / __|/ _ / __|
#| (_| | | | (_| \__ |  __\__ \
# \__,_|_|_|\__,_|___/\___|___/

# list & grep
alias ll='ls -alFh --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'

#yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac='yt-dlp --extract-audio --audio-format flac --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s" --restrict-filenames '
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
