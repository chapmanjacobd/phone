function webmpv
    am start -a android.intent.action.VIEW -t video/mpeg -d (yt-dlp -f bestvideo[height<=576]+bestaudio/best[height<=576] -g $argv)
end
