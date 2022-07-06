function opentabs
    argparse p/prefix n/qty -- $argv
    set -l file $argv[1]
    if set -q $_flag_prefix
        set pre $_flag_prefix
    else
        set pre 'https://www.google.com/search?q='
    end
    for tab in (head -$qty $file)
        echo $tab
        if test http = (string sub --length 4 "$tab")
            ~/.shortcuts/tasks/open-browser.sh $tab >/dev/null &
        else
            ~/.shortcuts/tasks/open-browser.sh "$pre$tab" >/dev/null &
        end
        sleep 1
    end
    wait
    sed -i -e 1,"$qty"d $file
end
