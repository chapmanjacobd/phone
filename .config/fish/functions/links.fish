function links
    for url in (ssh pakon lb openlinks ~/mc/links.db -w 'play_count=0' --cluster -c p1 --browser print)
        open-browser.sh "$url"
    end
end
