##############
# Aliases to use common advanced YT-DLP commands
##############
# Unless specified, usage is as follows:
# Example: yt-dlp-get-metadata <URL_OF_VIDEO>
#
# All download options embed chapters, thumbnails, and metadata when available.
# Metadata files such as Thumbnail, a URL link, and Subtitles (Including Automated subtitles) are written next to the media file in the same folder for Media Server compatibility.
#
# All options also trim filenames to a maximum of 248 characters
# The character limit is set slightly below most filesystem maximum filenames
# to allow for FilePath data on systems that count paths in their length.
##############

# Basic Archive command.
# Writes files: description, thumbnail, URL link, and subtitles into a named folder:
# Output Example: ./Title - Creator (Year)/Title-Year.ext
DESTINATION="~/storage/download/termux-ytdl"

alias yt-dlp-archive='cd $DESTINATION && yt-dlp \
--embed-thumbnail \
--embed-metadata \
--embed-chapters \
--write-thumbnail \
--write-description \
--write-url-link \
--write-subs \
--write-auto-subs \
--sub-format srt \
--trim-filenames 248 \
--sponsorblock-mark all \
--output "%(title)s - %(channel,uploader)s (%(release_year,upload_date>%Y)s)/%(title)s - %(release_year,upload_date>%Y)s - [%(id)s].%(ext)s"'

# Archiver in Playlist mode.
# Writes files: description, thumbnail, URL link, subtitles, auto-subtitles
#
# NOTE: The output will be a folder: Playlist_Name/Title-Creator-Year.ext
# This is different from the above, to avoid large amount of folders.
# The assumption is you want only the playlist as it appears online.
# Output Example: ./Playlist-name/Title - Creator (Year)/Title-Year.ext
alias yt-dlp-archive-playlist='cd $DESTINATION && yt-dlp \
--embed-thumbnail \
--embed-metadata \
--embed-chapters \
--write-thumbnail \
--write-description \
--write-url-link \
--write-subs \
--write-auto-subs \
--sub-format srt \
--trim-filenames 248 \
--sponsorblock-mark all \
--output "%(playlist)s/%(title)s - %(creators,creator,channel,uploader)s - %(release_year,upload_date>%Y)s - [%(id)s].%(ext)s"'

# Audio Extractor
# Writes: <ARTIST> / <ALBUM> / <TRACK> with fallback values
# Embeds available metadata
alias yt-dlp-audio-only='cd $DESTINATION && yt-dlp \
--embed-thumbnail \
--embed-metadata \
--embed-chapters \
--extract-audio \
--audio-quality 320K \
--trim-filenames 248 \
--output "%(artist,channel,album_artist,uploader)s/%(album)s/%(track,title,track_id)s - [%(id)s].%(ext)s"'

# Batch mode for downloading multiple videos from a list of URLs in a file.
# Must provide a file containing URL's as your argument.
# Writes files: description, thumbnail, URL link, subtitles, auto-subtitles
#
# Example usage: yt-dlp-batch ~/urls.txt
alias yt-dlp-batch='cd $DESTINATION && yt-dlp \
--embed-thumbnail \
--embed-metadata \
--embed-chapters \
--write-thumbnail \
--write-description \
--write-url-link \
--write-subs \
--write-auto-subs \
--sub-format srt \
--trim-filenames 248 \
--sponsorblock-mark all \
--output "%(title)s - %(channel,uploader)s (%(release_year,upload_date>%Y)s)/%(title)s - %(release_year,upload_date>%Y)s - [%(id)s].%(ext)s" \
--batch-file'

# Livestream recording.
# Writes files: thumbnail, url link, subs and auto-subs (if available).
# Also writes files: Info.json and Live Chat if available.
alias yt-dlp-livestream='cd $DESTINATION && yt-dlp \
--live-from-start \
--write-thumbnail \
--write-url-link \
--write-subs \
--write-auto-subs \
--write-info-json \
--sub-format srt \
--trim-filenames 248 \
--output "%(title)s - %(channel,uploader)s (%(upload_date)s)/%(title)s - (%(upload_date)s) - [%(id)s].%(ext)s"'

##############
# UTILITIES:
# Yt-dlp based tools that provide uncommon outputs.
##############

# Only download metadata, no downloading of video or audio files
# Writes files: Description, Info.json, Thumbnail, URL Link, Subtitles
# The usecase for this tool is grabbing extras for videos you already have downloaded, or to only grab metadata about a video.
alias yt-dlp-get-metadata='cd $DESTINATION && yt-dlp \
--skip-download \
--write-description \
--write-info-json \
--write-thumbnail \
--write-url-link \
--write-subs \
--write-auto-subs \
--sub-format srt \
--trim-filenames 248'

# Takes in a playlist URL, and generates a CSV of the data.
# Writes a CSV using a pipe { | } as a delimiter, allowing common delimiters in titles.
# Titles that contain invalid file characters are replaced.
#
# !!! IMPORTANT NOTE - THIS OPTION USES COOKIES !!!
# !!! MAKE SURE TO SPECIFY THE CORRECT BROWSER !!!
# This is required if you want to grab information from your private or unlisted playlists
#
#
# Documents columns:
# Webpage URL, Playlist Index Number, Title, Channel/Uploader, Creators,
# Channel/Uploader URL, Release Year, Duration, Video Availability, Description, Tags
alias yt-dlp-export-playlist-info='cd $DESTINATION && yt-dlp \
--skip-download \
--cookies-from-browser firefox \
--ignore-errors \
--ignore-no-formats-error \
--flat-playlist \
--trim-filenames 248 \
--print-to-file "%(webpage_url)s#|%(playlist_index)05d|%(title)s|%(channel,uploader,creator)s|%(creators)s|%(channel_url,uploader_url)s|%(release_year,upload_date)s|%(duration>%H:%M:%S)s|%(availability)s|%(description)s|%(tags)s" "%(playlist_title,playlist_id)s.csv" \
--replace-in-metadata title "[\|]+" "-"'
