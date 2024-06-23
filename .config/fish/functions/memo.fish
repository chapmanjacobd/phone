function memo --argument num
    if test -n "$num"
        if test -f ~/memo/$num
            cat ~/memo/$num
        else
            echo Memo $num not found
        end
    else
        set file (iter_filename ~/memo/)
        cb >$file
        echo Saved memo (path basename $file)
    end
end
