function randvid
    fd -eMP4 -eWEBM -eMKV $argv | shuf | head -1
end
