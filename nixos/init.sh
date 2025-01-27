#!/usr/bin/bash

stow --dir=$HOME/os/cfg --target=$HOME/ git yazi kitty xonsh ulauncher ghostty

sudo stow --dir=$HOME/os/cfg --target=/etc/ nix