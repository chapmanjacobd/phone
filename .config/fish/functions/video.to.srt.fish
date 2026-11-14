function video.to.srt --argument input stream
    if test -z "$input"
        printf 'Usage: video.to.srt INPUT [SUBTITLE_STREAM]\n' >&2
        return 2
    end

    if test -z "$stream"
        set stream 0
    end

    ffmpeg -nostdin -i "$input" -map "0:s:$stream" -c:s srt -y (path change-extension srt "$input")
end
