# Defined interactively
function ls -w eza
    if status --is-interactive
        if test -d .git
            eza --git --long --header --classify --sort=type --group-directories-first $argv
        else
            eza --long --header --classify --sort=none --group-directories-first $argv
        end
    else
        /usr/bin/ls --sort=none $argv
    end
end
