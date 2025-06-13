function battery_percent
    termux-battery-status | jq .percentage
end
