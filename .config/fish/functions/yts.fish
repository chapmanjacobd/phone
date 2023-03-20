function yts -w yt-dlp
    ytdl -f bestvideo[height<=576]+bestaudio/best[height<=576]/best --write-sub --write-auto-sub \
        --sub-lang 'en,EN,en.*,en-*,EN.*,EN-*eng,ENG,english,English,ENGLISH' \
        --embed-subs --compat-options no-keep-subs \
        --match-filter "requested_subtitles & duration > 59 & duration < 14399 & !is_live & !was_live" \
        $argv
end
