function pipinstall --wraps='pip install'
    pip install $argv
    and echo $argv | string split ' ' >>~/.github/pip_installed
    sort --unique --ignore-case ~/.github/pip_installed | sponge ~/.github/pip_installed
end
