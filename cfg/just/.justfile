rest:
  ~/os/nixos/init.sh

restsec:
  ~/sec/init.sh

unstow PACKAGE:
  stow --dir=$HOME/os/cfg --target=$HOME/ -D {{PACKAGE}}

reb:
    sudo nixos-rebuild switch --flake ~/os/nix#deimos

rebold:
    sudo nixos-rebuild switch --flake ~/rudra#default