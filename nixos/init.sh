#!/usr/bin/env bash 
DIRS=(
    git 

    yazi
    kitty 
    ghostty 

    ulauncher 
    just 

    bash
    #xonsh

    hypr
    dunst
    waybar
)
stow --dir=$HOME/os/cfg --target=$HOME/ "${DIRS[@]}"