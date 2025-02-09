#!/usr/bin/env bash 
DIRS=(
    git 

    yazi
    kitty 
    ghostty 

    ulauncher 
    just 

    bash
    zsh
    xonsh

    hypr
    dunst
    waybar
    jetbrains
    input
)
stow --dir=$HOME/os/cfg --target=$HOME/ -R "${DIRS[@]}"


TOOLS=(
    rofi
    wallpaper
)
stow --dir=$HOME/os/tools --target=$HOME/.local/bin -R "${TOOLS[@]}"