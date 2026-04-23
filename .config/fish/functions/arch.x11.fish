function arch.x11
    pulseaudio --start --exit-idle-time=-1
    pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

    export DISPLAY=:0
    termux-x11 :0 &

    virgl_test_server_android &
end
