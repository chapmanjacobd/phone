function links
    ssh pakon sync_links

    for url in (ssh pakon lb openlinks ~/mc/links.db -w 'play_count=0' --cluster -c p1 --browser print)
        open-browser.sh "$url"
        sleep 1
    end
end
