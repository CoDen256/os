rest:
  ~/os/nixos/init.sh

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

reb:
    sudo nixos-rebuild switch --flake ~/os/nixos#default

rebold:
    sudo nixos-rebuild switch --flake ~/rudra#default