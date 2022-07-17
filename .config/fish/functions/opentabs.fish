function opentabs
    argparse 'p/prefix=' 'n/qty=' -- $argv
    set -l file $argv[1]

    if set -q _flag_prefix
        set pre $_flag_prefix
    else
        set pre 'https://www.google.com/search?q='
    end

    if set -q _flag_qty
        set qty $_flag_qty
    else
        set qty 7
    end

    wip ~/mc

    set tabs (head -n $qty $file)

    for tab in $tabs
        echo $tab
        if test http = (string sub --length 4 "$tab")
            ~/.shortcuts/tasks/open-browser.sh "$tab" >/dev/null &
        else
            ~/.shortcuts/tasks/open-browser.sh "$pre$tab" >/dev/null &
        end
        sleep 1
    end
    wait
    sed -i -e 1,"$qty"d $file
    
    wip ~/mc
end
