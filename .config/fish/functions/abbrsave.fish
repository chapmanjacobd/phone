function abbrsave
    abbr -a -- $argv[1] $argv[2..-1]
    filterfile ~/.config/fish/abbreviations "abbr -a -- $argv[1] "
    echo abbr -a -- $argv[1] (string escape -- $argv[2..-1]) >>~/.config/fish/abbreviations
end
