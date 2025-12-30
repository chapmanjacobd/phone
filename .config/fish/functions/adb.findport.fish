function adb.findport
    echo Scanning takes up to 60 seconds or so...
    set -l adb_port (nmap -sT -p30000-50000 --open localhost | grep -m1 -oP "^\d+")

    adb connect localhost:$adb_port
    adb shell
end
