function arch.x11.quit
    pkill pulseaudio
    pkill virgl_test_server_android
    pkill -9 -f termux.x11
end
