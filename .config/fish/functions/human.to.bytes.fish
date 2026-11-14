# Defined interactively
function human.to.bytes
    if test (count $argv) -eq 0
        python -c "import sys; from library.utils import nums; [print(nums.human_to_bytes(l)) for l in sys.stdin]"
    else
        python -c "from library.utils import nums; print(nums.human_to_bytes('$argv'))"
    end
end
