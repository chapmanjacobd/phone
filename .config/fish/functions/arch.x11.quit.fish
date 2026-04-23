function arch.x11.quit
    pkill pulseaudio
    pkill virgl_test_server_android
    pkill termux-x11
end
