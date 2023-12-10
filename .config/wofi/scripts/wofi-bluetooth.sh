#!/bin/bash

# Get a list of all paired Bluetooth devices
devices=$(bluetoothctl paired-devices)

# Create a menu of the devices
menu=$(whiptail --title "Select a Bluetooth device" --menu "Choose a device to connect to:" 15 60 4 "${devices[@]}" 3>&1 1>&2 2>&3)

# Connect to the selected device
bluetoothctl connect "$menu"

# Print a message to the user
echo "Connected to $menu"
