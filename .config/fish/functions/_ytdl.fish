function _ytdl
    yt-dlp \
        -o "%(extractor_key,extractor,ie_key).220B/%(uploader,uploader_id,channel,channel_id,creator,artist,author,playlist_uploader,playlist_uploader_id,playlist_channel,playlist_channel_id,webpage_url_basen
ame).220B/%(album,playlist_title,playlist,playlist_id).220B/%(title).170B_%(view_count)3.2D_[%(id).64B].%(ext)s" \
        --download-archive ~/.local/share/yt_archive.txt --retries 13 --extractor-retries 13 \
        --embed-metadata --no-progress --sleep-requests 1 --compat-options no-live-chat \
        --reject-title "Trailer|Sneak Peek|Preview|Review|Teaser|Promo|Live |Stream|Twitch|Crypto|Meetup|Montage|Bitcoin|Makeup|Apology|Clip |Top 10|Top Ten|Panel|Red Carpet Premiere|Now Playing|In Theaters| Scene |Announcement|First Look|Final Look|Outtakes|360|World Premiere|Event|TV Spot|Advert|campaign|Horror|Graphics Card| GPU | Terror| AWARD|Ceremony" \
        # --cookies-from-browser firefox \
        # --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0" \
        $argv
end
