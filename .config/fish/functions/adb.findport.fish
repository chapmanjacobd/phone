function adb.findport
    echo Scanning takes up to 60 seconds or so...

    nmap -sT -p30000-50000 --open localhost | grep -oP "^\d+(?=/tcp)" | while read port
        if adb connect localhost:$port
            adb shell
            return 0
        end
    end

    echo "No valid ADB ports found"
    return 1
end
