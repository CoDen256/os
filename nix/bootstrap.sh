#!/usr/bin/env bash 

ssh-keygen # -> add to github

nix-shell -p git stow just

sudo mv /etc/nixos /etc/nixos.backup

git clone git@github.com:CoDen256/os.git ~/os

~/os/init.sh

cd nixos
NIX_CONFIG="experimental-features = nix-command flakes"
just reb