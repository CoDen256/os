#!/bin/bash

sudo apt update && sudo apt upgrade

# wifi drivers Alpha AWUS https://github.com/morrownr/8814au
sudo apt install -y linux-headers-$(uname -r) build-essential git bc dkms libelf-dev rfkill iw
git clone https://github.com/morrownr/8814au.git
cd 8814au
sudo ./install-driver.sh
sudo dkms status
cd
rm -rf 8814au

# this repo
git clone git@github.com:CoDen256/os.git ~/os

# xonsh-shell
sudo apt install -y pipx
pipx install 'xonsh[full]' pygments prompt-toolkit setproctitle   

which xonsh | sudo tee -a /etc/shells
chsh -s $(which xonsh) coden

xonsh
xpip install -U xontrib-pipeliner

# mise
curl https://mise.run | sh

# config files
xonsh ~/os/cfg/init.xsh

xonsh ~/.xonshrc
# actual setup
xonsh setup.app.xsh
xonsh setup.dev.xsh