#!/bin/bash


sudo apt update && sudo apt upgrade

# wifi drivers Alpha AWUS https://github.com/morrownr/8814au
sudo apt install -y linux-headers-$(uname -r) build-essential bc dkms git libelf-dev rfkill iw
git clone https://github.com/morrownr/8814au.git
cd 8814au
sudo ./install-driver.sh
sudo dkms status


# xonsh-shell
sudo apt install xonsh

which xonsh >> /etc/shells
chsh -s $(which xonsh)

# .dotfiles