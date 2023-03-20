# Defined in /tmp/fish.FCdsd2/yt.title.fish @ line 2
function ytm.filename
    ytdl -i -o "%(playlist_index)s-%(title)s-%(uploader)s-%(id)s" --get-filename --skip-download $argv
end
