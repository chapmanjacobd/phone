function schedule
    set c $argv[1]

    echo $c
    for op in $argv[2..-1]
        set c (chronocalc "$c + $op")
        echo $op $c
    end
end
