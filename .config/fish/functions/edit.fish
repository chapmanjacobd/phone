function edit
    nano "$argv"
    lb folder merge relative-copy "$argv" ~/.termux/prefix/ --relative-to=$PREFIX
end
