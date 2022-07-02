function randvid
    #fd -eMP4 -eWEBM -eMKV . $folder | shuf | head -1
    python lb/watch.py lb/$argv -p --filename -L 1 -O
end
