function randvid
    set searchdir (dirname (fd -eMP4 -eWEBM -eMKV $argv | shuf | head -1))
    fd -eMP4 -eWEBM -eMKV . $searchdir | sort | head -1
end
