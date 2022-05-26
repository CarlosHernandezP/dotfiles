bluetoothctl power on
bluetoothctl agent on
bluetoothctl devices | rofi -dmenu | awk '{print $2}' | xargs bluetoothctl connect
if [ $? -eq 0 ]; then
    rofi -e "Great Success!"
else
    rofi -e "Failed to connect"
fi
