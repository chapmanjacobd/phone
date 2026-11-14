function coalesce
    for val in $argv
        if test "$val" != ""
            echo $val
            break
        end
    end
end
