# Defined interactively
function size.human
    if test (count $argv) -eq 0
        python -c "import sys; from humanize import naturalsize; [print(naturalsize(float(l), binary=True)) for l in sys.stdin]"
    else
        python -c "from humanize import naturalsize; print(naturalsize(float('$argv'), binary=True))"
    end
end
