if status is-interactive
    bind \e\[1\;5C forward-word
    bind \e\[1\;5D backward-word
    bind \b backward-kill-path-component
    bind \e\[1\;3C forward-bigword
    bind \e\[1\;3D backward-bigword
    bind \e\x7F backward-kill-bigword
    bind \cy redo
    bind \ey yank

    bind \e\[99\;6u fish_clipboard_copy
    bind \e, kill-selection backward-kill-bigword yank yank
    bind --preset \ct transpose-words

    source $__fish_config_dir/abbreviations
    fish_config theme choose nothing
end

if not pgrep -f crond >/dev/null
    echo "[Starting crond...]" && crond && echo "[OK]"
end

zoxide init fish | source
