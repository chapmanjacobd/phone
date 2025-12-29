function apk.export
    adb shell pm path $argv | sed 's/^package://g' | xargs -L1 adb pull
end
