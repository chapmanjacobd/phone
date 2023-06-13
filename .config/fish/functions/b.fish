function b
    fish -c (string join -- ' ' (string escape -- $argv)) &
end
