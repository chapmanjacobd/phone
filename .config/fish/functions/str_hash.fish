function str_hash
    echo "$argv" | md5sum - | cut -d' ' -f1
end
