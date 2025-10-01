#!/usr/bin/env bash 
DIRS=(
    git 

    yazi
    kitty 

    just 

    bash
    #zsh
    xonsh

    jetbrains
    input
)
stow --dir=$HOME/os/cfg --target=$HOME/ -R "${DIRS[@]}"