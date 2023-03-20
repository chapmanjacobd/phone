# Defined interactively
function ytdl
    _ytdl --youtube-skip-dash-manifest --youtube-skip-hls-manifest $argv
    or _ytdl $argv
end
