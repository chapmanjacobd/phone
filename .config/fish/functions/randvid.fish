function randvid --argument db
    #fd -eMP4 -eWEBM -eMKV . $folder | shuf | head -1
    python lb/watch.py lb/$db -p --filename -L 1 -O $argv
end
