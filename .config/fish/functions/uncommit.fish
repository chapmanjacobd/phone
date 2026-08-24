function uncommit
    git reset --soft HEAD^
    git log HEAD -1
    # git push --force-with-lease --force-if-includes
end
