#!/bin/bash

while true; do
    battery_status=$(acpi -b | awk '{print $3}')

    if [[ "$battery_status" == "Discharging," ]]; then
        battery_level=$(acpi -b | grep -oP '\d+%' | tr -d '%')

        if [[ -n $battery_level ]]; then
            if (( battery_level <= 10 )); then
                notify-send -t 0 "_systemd" "Battery status: VERY LOW!!!" 
            elif (( battery_level == 15 )); then
                notify-send -t 1000 "_systemd" "Battery status: LOW"
            fi
        else
            echo "Error getting battery level!" >&2
        fi
    else
        echo "Battery is not discharging." >&2
    fi

    # 2 minutes before checking again
    sleep 120
done
