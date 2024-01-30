function trash
    if test (count $argv) -eq 1
        rm -rf "$argv"
    else
        echo "Only one arg allowed"
    end
end
