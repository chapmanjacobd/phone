function aptinstall --wraps='apt install'
    apt install $argv
    and echo $argv | string split ' ' >>~/.github/apt_installed
    sort --unique --ignore-case ~/.github/apt_installed | sponge ~/.github/apt_installed
end
