function __fish_print_pipestatus
    set -l last_status
    if set -q __fish_last_status
        set last_status $__fish_last_status
    else
        set last_status $argv[-1] # default to $pipestatus[-1]
    end
    set -l left_brace "["
    set -l right_brace "]"
    set -l separator "|"
    set -l brace_sep_color (set_color $fish_color_status)
    set -l status_color (set_color $bold_flag $fish_color_status)

    if not set -q argv[1]
        echo error: missing argument >&2
        status print-stack-trace >&2
        return 1
    end

    if test (count $argv) -eq 1 -a $last_status -eq 0
        return
    end

    function fish_status_to_signal
        __fish_make_completion_signals # Make sure signals are cached
        for arg in $argv
            if test $arg -gt 128
                # Important: each element of $__kill_signals is a string like "10 USR1"
                if set -l signal_names (string replace -r --filter '^'(math $arg-128)' ' SIG $__kill_signals)
                    # Some signals have multiple mnemonics. Pick the first one.
                    echo (printf "%s/%s" $arg $signal_names[1])
                else
                    echo $arg
                end
            else
                echo $arg
            end
        end
        return 0
    end

    set -l normal (set_color normal)
    set -l sep $brace_sep_color$separator$status_color
    set -l last_pipestatus_string (fish_status_to_signal $argv | string join "$sep")
    set -l last_status_string ""
    if test "$last_status" -ne "$argv[-1]"
        set last_status_string " "$status_color$last_status
    end

    printf "%s" $normal $brace_sep_color $left_brace \
        $status_color $last_pipestatus_string \
        $normal $brace_sep_color $right_brace $normal $last_status_string $normal
end
