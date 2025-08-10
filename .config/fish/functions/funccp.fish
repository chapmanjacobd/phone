# Defined interactively
function funccp --argument old new
    set funcdir ~/.config/fish/functions/
    cp $funcdir/$old.fish $funcdir/$new.fish
    sed "s|$old|$new|" -i $funcdir/$new.fish
end
