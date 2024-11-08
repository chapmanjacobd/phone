function delmemo
    rg $argv memo/
    rm (rg --files-with-matches $argv memo/)
end
