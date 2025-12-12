# Defined interactively
function funcmv --argument old new
    set funcdir ~/.config/fish/functions
    sed -E "s/([[:space:]()\"'])$old\b/\1$new/g" -i $funcdir/*.fish ~/.local/share/fish/fish_history ~/.config/fish/abbreviations
    mv $funcdir/$old.fish $funcdir/$new.fish
    echo abbrsave $old $new
end
