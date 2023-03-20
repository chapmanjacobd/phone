function asc
    sort | uniq -c | sort -g $argv
end
