#!/bin/bash

ssh-keygen # -> add to github

nix-shell -p git
nix-shell -p stow

sudo mv /etc/nixos /etc/nixos.backup

git clone git@github.com:CoDen256/os.git ~/os
bash ~/os/cfg/init.sh

sudo nixos-rebuild switch