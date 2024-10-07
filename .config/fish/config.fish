if status is-interactive
    bind \e\[1\;5C forward-bigword
    bind \e\[1\;5D backward-bigword
    bind \b backward-kill-bigword
    bind \e\[99\;6u fish_clipboard_copy
    bind \e, backward-kill-bigword yank yank
    bind --preset \ct transpose-words
    bind \cy redo
    bind \cY yank

    source $__fish_config_dir/abbreviations
end

if not pgrep -f "crond" >/dev/null
    echo "[Starting crond...]" && crond && echo "[OK]"
end

zoxide init fish | source
