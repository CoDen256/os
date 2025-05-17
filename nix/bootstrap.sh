#!/usr/bin/env bash 

ssh-keygen # -> add to github

nix-shell -p git stow just

sudo mv /etc/nixos /etc/nixos.backup

git clone git@github.com:CoDen256/os.git ~/os

~/os/init.sh

cd nixos
export NIX_CONFIG="experimental-features = nix-command flakes"
just reb

mkdir ~/dev
mkdir ~/rev
mkdir ~/ome
git clone git@github.com:CoDen256/sec.git ~/sec
git clone git@github.com:CoDen256/zmk.git ~/zmk
git clone git@github.com:CoDen256/obsidian.git ~/docs/obsidian