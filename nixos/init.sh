#!/usr/bin/env bash 
DIRS=(
    git 

    yazi 
    kitty 
    ghostty 

    ulauncher 
    just 

    bash
    xonsh
)
stow --dir=$HOME/os/cfg --target=$HOME/ "${DIRS[@]}"