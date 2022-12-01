function apk_install
    termux-open --view --content-type "application/vnd.android.package-archive" $argv
end
