function abbrcp
    set -l args $argv
    if test (count $args) -lt 1
        echo "Usage: abbrcp <exact_abbr_name>"
        return 1
    end

    # Matches 'abbr -a -- <your_search> ' specifically
    ssh pakon "fish -c 'abbr'" | string match -r "abbr -a -- $args[1]\s.*" >>~/.config/fish/abbreviations
end
