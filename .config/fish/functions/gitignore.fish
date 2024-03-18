function gitignore
    echo "$argv" | cat - .gitignore | sponge .gitignore
    if confirm 'git reset?'
        git reset -- :/"$argv"
        if confirm 'git rm --cached; git commit?'
            git rm --cached "$argv"
            git commit -m wip
        end
    end
end
