function fixcb
    string replace --all --regex '\s{2,}' '\n' -- (termux-clipboard-get) | termux-clipboard-set
end
