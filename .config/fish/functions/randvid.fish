function randvid --argument folder
    fd -eMP4 -eWEBM -eMKV . $folder | shuf | head -1
end
