#!/usr/bin/env xonsh

if not !(which stow):
    print("No stow. Installing")
    sudo apt-get install -y stow

stow --dir=~/os/cfg --target=~/ git yazi kitty xonsh ulauncher mise profile

stow --dir=~/os/cfg --target=/etc/ nix