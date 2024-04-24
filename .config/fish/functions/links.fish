function links
    ssh -t pakon sync_links

    for url in (ssh pakon lb openlinks /home/xk/mc/links.db -w 'play_count=0' --cluster -c p1 --browser print)
        open-browser.sh "$url"
        sleep 1
    end

    ssh -t pakon wip /home/xk/mc/
    ssh -t pakon sync_links
end
