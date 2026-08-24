# Defined interactively
function abbrdel
    file.lines.filter ~/.config/fish/abbreviations "abbr -a -- $argv[1] "
end
