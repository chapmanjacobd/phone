function yt -w yt-dlp
    ytdl -i -f bestvideo[height<=576]+bestaudio/best[height<=576]/best --write-sub --write-auto-sub \
        --sub-lang 'en,EN,en.*,en-*,EN.*,EN-*eng,ENG,english,English,ENGLISH' \
        --embed-subs --compat-options no-keep-subs \
        --match-filter "duration >? 59 & duration <? 14399 & live_status=?not_live" \
        $argv
end
