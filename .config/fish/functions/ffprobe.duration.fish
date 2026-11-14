# Defined interactively
function ffprobe.duration
    python -c "import sys; from library.utils import processes; print(processes.FFProbe(sys.argv[1]).duration)" $argv
    # ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $argv
end
