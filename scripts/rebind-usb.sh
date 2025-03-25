#!/bin/bash

#echo -n "1-7" | sudo tee /sys/bus/usb/drivers/usb/unbind
#sleep 1
#echo -n "1-7" | sudo tee /sys/bus/usb/drivers/usb/bind

if [ ! $(whoami) == "root" ]; then
    echo "I am not root. Exiting."
    exit 1
fi 

# March 2025
# This script was made to address the issue of the USB Hub disconnecting from the laptop.
# While this script does work in rebinding the USB Hub, I ended up replacing the USB Cable. It seems to be working better

# Rebind USB hub
echo "== Attempting to Rebind USB Hub"
echo -n "0000:00:14.0" | sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind
sleep 2
echo -n "0000:00:14.0" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind
echo "== Rebind USB Hub Complete"

