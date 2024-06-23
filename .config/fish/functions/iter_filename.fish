function iter_filename
    argparse 's/suffix=' -- $argv
    or return 1

    set -l counter 1
    while true
        set -l filename "$argv[1]$counter$_flag_suffix"
        if not test -e $filename
            echo $filename
            return 0
        end
        set counter (math $counter + 1)
    end
end
