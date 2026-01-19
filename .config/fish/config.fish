status job-control full  # https://github.com/fish-shell/fish-shell/issues/5036

if not pgrep -f crond >/dev/null
    crond
end

if not status --is-interactive
    return 0
end

################################################################################                  ##
################################################################################ interactive zone ##
################################################################################                  ##

source $__fish_config_dir/abbreviations
fish_config theme choose nothing

source ~/.config/fish/functions/ls.fish

fzf_configure_bindings --directory=\cf --git_status=\cs --processes=\cp
_env_vars_update_servers

bind ctrl-backspace backward-kill-word
bind ctrl-left backward-word
bind ctrl-right forward-word
bind ctrl-delete kill-word

# https://github.com/fish-shell/fish-shell/issues/10926#issuecomment-2689671305
bind alt-backspace backward-kill-token
bind alt-right nextd-or-forward-token
bind alt-left prevd-or-backward-token
bind alt-delete kill-token

bind alt-r history-token-search-backward

bind \e\[99\;6u fish_clipboard_copy

bind \e, kill-selection backward-kill-token yank yank

bind ctrl-y redo
bind alt-y yank
bind ctrl-u yank
bind ctrl-k kill-line
bind ctrl-l backward-kill-line

bind ctrl-t transpose-words

function cmd_to_clipboard
    commandline | head -c -1 | cb
end
bind \e\[99\;6u cmd_to_clipboard

function insert_previous_command
    commandline --insert -- (history -1)
end
bind \e/ insert_previous_command

source $__fish_config_dir/abbreviations

function multicd
    echo (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item

abbr -a --set-cursor=! -- for for\ s\ in\ \*\n!\ \$s\nend

function _abbr_zip
    echo zip -qr (datestamp).zip
end
abbr -a zip --function _abbr_zip

function _abbr_cbargs
    echo echo (cb | string join ' ' | string replace '⏎' '') \| string split "' '"
end
abbr -a cbargs --function _abbr_cbargs

function _abbr_parallel
    echo parallel --eta --joblog ~/.jobs/joblog_(date +%Y-%m-%dT%H%M%S).log --shuf --resume-failed --timeout 8000%
end
abbr -a parallel --function _abbr_parallel

abbr_random_line wtv ~/watch
abbr_random_line ltv ~/listen
abbr_random_line links ~/links

function _abbr_ltc
    if test (hostname) = len
        echo 'catt.default Bedroom; cr && lt -c -t Bedroom'
    else
        echo 'catt.default Xylo and Orchestra; cr && lt -c'
    end
end
abbr -a ltc --function _abbr_ltc

abbr 4DIRS --set-cursor=! "$(string join \n -- 'for dir in */' 'cd $dir' '!' 'cd ..' 'end')"

zoxide init fish | source

set fish_color_host_remote (~/bin/str_rgb.py $hostname)
