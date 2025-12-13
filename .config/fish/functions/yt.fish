function yt -w yt-dlp
    ytdl -i --format-sort res:576 --check-formats --format '(bestvideo[filesize<2G]+bestaudio/best[filesize<2G]/bestvideo*+bestaudio/best)[format_id!$=-drc][dynamic_range!^=HDR]/bestvideo[filesize<2G]+bestaudio/best[filesize<2G]/bestvideo*+bestaudio/best' \
        --sub-lang 'en,EN,en.*,en-*,EN.*,EN-*eng,ENG,english,English,ENGLISH' --embed-subs \
        --match-filter "duration >? 59 & duration <? 14399 & live_status=?not_live" \
        $argv
end
