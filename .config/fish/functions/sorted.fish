# Defined via `source`
function sorted
    if isatty stdin
        sort --unique --stable --ignore-case $argv | sponge $argv
    else
        cat - | string trim | sort --unique --stable --ignore-case | strip
    end
end
