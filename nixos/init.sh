#!/usr/bin/env bash 

stow --dir=$HOME/os/cfg --target=$HOME/ git yazi kitty xonsh ulauncher ghostty bash

sudo stow --dir=$HOME/os/cfg --target=/etc/ nix