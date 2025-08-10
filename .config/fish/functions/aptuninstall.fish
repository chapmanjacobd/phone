function aptuninstall --wraps='apt install'
    for arg in $argv
        filterfile ~/.github/apt_installed $arg
    end
    apt remove $argv
end
