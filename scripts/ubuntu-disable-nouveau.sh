#!/bin/bash

echo "This is for Ubuntu 24"
echo "Installing NVIDIA Drivers fro M1000M GPU"

function disable_nouveau {
sudo bash -c "echo 'blacklist nouveau' > /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo 'options nouveau modeset=0' >> /etc/modprobe.d/blacklist-nouveau.conf"


sudo update-initramfs -u

}

function install_nvidia {
	sudo ubuntu-drivers install
}
