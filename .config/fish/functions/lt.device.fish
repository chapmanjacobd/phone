function lt.device --argument host
    set -q host[1]; or set host (hostname)
    switch $host
        case len
            echo Bedroom
        case pakon
            echo Kitchen
        case phone
            echo Bathroom
        case '*'
            echo Bedroom
    end
end
