set PATH $HOME/.anyenv/bin $PATH
set PATH $HOME/assets/bin $PATH
set PATH $HOME/assets/nodescripts $PATH

alias ll='ls -a -l --time-style=long-iso'

alias youtube-dl='youtube-dl --verbose' # --verbose: Print various debugging information
alias :ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
alias :ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
