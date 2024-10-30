function edit
    nano "$argv"
    lb relcp "$argv" ~/.termux/prefix/ --relative-to=$PREFIX
end
