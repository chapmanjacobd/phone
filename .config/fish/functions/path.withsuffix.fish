function path.withsuffix --description 'Print INPUT with SUFFIX inserted before its extension: path.withsuffix SUFFIX [--ext EXT] INPUT'
    argparse --name=path.withsuffix --min-args=1 --max-args=2 'e/ext=' -- $argv
    or return

    set -l suffix
    if test (count $argv) -eq 2
        set suffix $argv[1]
    end

    set -l input $argv[-1]

    if test -z "$suffix"; and not set -q _flag_ext
        printf 'Usage: path.withsuffix SUFFIX [--ext EXT] INPUT\n' >&2
        return 2
    end

    set -l output_extension (path extension "$input")
    set -l forced_extension

    if set -q _flag_ext
        set forced_extension (string trim --left --chars . -- "$_flag_ext[-1]")
    end

    if test -n "$forced_extension"
        set output_extension ".$forced_extension"
    end

    path change-extension "$suffix$output_extension" "$input"
end
