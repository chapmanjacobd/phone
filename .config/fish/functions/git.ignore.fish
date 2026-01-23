# Defined via `source`
function git.ignore
    touch .gitignore
    echo "$argv" | cat - .gitignore | sponge .gitignore
    if gum confirm --default=no 'git reset?'
        git reset -- :/"$argv"
        if gum confirm --default=no 'git rm --cached; git commit?'
            git rm --cached "$argv"
            git commit -m wip
        end
    end
end
